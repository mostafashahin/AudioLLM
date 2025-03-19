from transformers import Qwen2AudioForConditionalGeneration, AutoProcessor, BitsAndBytesConfig
from datasets import load_from_disk
from sklearn.metrics import classification_report
from sklearn.metrics import recall_score
import pandas as pd
import torch
import os
import fire


if torch.cuda.is_available():
    device = torch.device('cuda')
else:
    device = torch.device('cpu')

gender_map = {'M':'male','F':'female'}

def create_directory_if_not_exists(directory_path):
    """Creates a directory if it does not already exist.

    Args:
        directory_path: The path to the directory to create.
    """
    if not os.path.exists(directory_path):
        try:
            os.makedirs(directory_path)  # Use makedirs to create nested directories
            print(f"Directory '{directory_path}' created.")
        except OSError as e:
            print(f"Error creating directory '{directory_path}': {e}")
    else:
        print(f"Directory '{directory_path}' already exists.")

def prompt_with_audio(audio, prompt, model, processor):
    conversation = [
        {'role': 'system', 'content': 'You are a helpful assistant.'}, 
        {"role": "user", "content": [
            {"type": "audio", "audio": "audio.wav"},
            {"type": "text", "text": prompt},
        ]},
    ]
    text = processor.apply_chat_template(conversation, add_generation_prompt=True, tokenize=False)
    audios = [audio]
    inputs = processor(text=text, audios=audios, return_tensors="pt", padding=True, sampling_rate=16_000).to(device)
    #inputs.input_ids = inputs.input_ids.to("cuda")
    generate_ids = model.generate(**inputs, max_length=2048)
    generate_ids = generate_ids[:, inputs.input_ids.size(1):] # to get only the generated text
    response = processor.batch_decode(generate_ids, skip_special_tokens=True, clean_up_tokenization_spaces=False)[0]
    return response

def detect_CI_batch(batch, prompt, model, processor, debug=False):
    audio = batch['audio']["array"]
    
    if '[AGE]' in prompt:
        prompt = prompt.replace('[AGE]',str(batch['age']))
    if '[LANGUAGE]' in prompt:
        prompt = prompt.replace('[LANGUAGE]',batch['lang'])
    if '[GENDER]' in prompt:
        prompt = prompt.replace('[GENDER]', gender_map[batch['sex']])
    batch['prompt'] = prompt
    
    response = prompt_with_audio(audio, prompt, model, processor)
    if debug:
        print(response)
    batch['response'] = response
    if "MCI" in response:
        batch['dx_pred'] = "MCI"
    elif "NC" in response:
        batch['dx_pred'] = "NC"
    elif "DM" in response:
        batch['dx_pred'] = "DM"
    elif "CI" in response:
        batch['dx_pred'] = "CI"
    else:
        batch['dx_pred'] = "Unknown"
    return batch

def get_class_results(data, ref_col, pred_col):
    return classification_report(data[ref_col], data[pred_col], output_dict=True) 

def load_prompts(prompts_file):
    with open(prompts_file) as f:
        prompts = f.read().splitlines()
    return prompts

def process_data(dataset_path, prompts_file, output_dir, quantize=True, debug=False, n_classes=2, ci=False):
    create_directory_if_not_exists(output_dir)
    csv_file = os.path.join(output_dir, "results.csv")
    pred_dataset_path = os.path.join(output_dir, "pred_dataset")
    create_directory_if_not_exists(pred_dataset_path)
    
    #Loading the model
    quantization_config = BitsAndBytesConfig(load_in_8bit=True)
    processor = AutoProcessor.from_pretrained("Qwen/Qwen2-Audio-7B-Instruct")
    if quantize:
        model = Qwen2AudioForConditionalGeneration.from_pretrained("Qwen/Qwen2-Audio-7B-Instruct", quantization_config=quantization_config, device_map=device)
    else:
        model = Qwen2AudioForConditionalGeneration.from_pretrained("Qwen/Qwen2-Audio-7B-Instruct", device_map=device)
    model.tie_weights()
    print(f"Model loaded to device {model.device}")
    data = load_from_disk(dataset_path)
    prompts = load_prompts(prompts_file)
    results = []
    #pred_dataset = []
    for i in range(len(prompts)):
        prompt = prompts[i]
        print(prompt)
        data_pred = data.map(detect_CI_batch, fn_kwargs={'prompt': prompt,'model':model, 'processor':processor, 'debug':debug});
        #pred_dataset.append(deepcopy(data_pred))
        data_pred.remove_columns(['audio']).save_to_disk(os.path.join(pred_dataset_path,f'data_prompt_{i}'))
        results_d = get_class_results(data_pred, 'dx','dx_pred')
        if n_classes == 2 and not ci:
            results.append({"prompt":prompt, 
                            "MCI_recall":results_d["MCI"]["recall"],
                           "MCI_precision":results_d["MCI"]["precision"],
                           "MCI_f1-score":results_d["MCI"]["f1-score"],
                           "MCI_support":results_d["MCI"]["support"],
                           "NC_recall":results_d["NC"]["recall"],
                           "NC_precision":results_d["NC"]["precision"],
                           "NC_f1-score":results_d["NC"]["f1-score"],
                           "NC_support":results_d["NC"]["support"],
                           "UAR":results_d['macro avg']['recall'],
                           "f1_score_macro":results_d['macro avg']['f1-score'],
                           "f1_score_weighted":results_d['weighted avg']['f1-score']})
        if n_classes == 2 and ci:
            results.append({"prompt":prompt, 
                            "CI_recall":results_d["CI"]["recall"],
                           "CI_precision":results_d["CI"]["precision"],
                           "CI_f1-score":results_d["CI"]["f1-score"],
                           "CI_support":results_d["CI"]["support"],
                           "NC_recall":results_d["NC"]["recall"],
                           "NC_precision":results_d["NC"]["precision"],
                           "NC_f1-score":results_d["NC"]["f1-score"],
                           "NC_support":results_d["NC"]["support"],
                           "UAR":results_d['macro avg']['recall'],
                           "f1_score_macro":results_d['macro avg']['f1-score'],
                           "f1_score_weighted":results_d['weighted avg']['f1-score']})
        elif n_classes == 3:
            results.append({"prompt":prompt, 
                            "MCI_recall":results_d["MCI"]["recall"],
                           "MCI_precision":results_d["MCI"]["precision"],
                           "MCI_f1-score":results_d["MCI"]["f1-score"],
                           "MCI_support":results_d["MCI"]["support"],
                           "NC_recall":results_d["NC"]["recall"],
                           "NC_precision":results_d["NC"]["precision"],
                           "NC_f1-score":results_d["NC"]["f1-score"],
                           "NC_support":results_d["NC"]["support"],
                           "DM_recall":results_d["DM"]["recall"],
                           "DM_precision":results_d["DM"]["precision"],
                           "DM_f1-score":results_d["DM"]["f1-score"],
                           "DM_support":results_d["DM"]["support"],
                           "UAR":results_d['macro avg']['recall'],
                           "f1_score_macro":results_d['macro avg']['f1-score'],
                           "f1_score_weighted":results_d['weighted avg']['f1-score']})
        else:
            results.append({"prompt":prompt,
                           "UAR":results_d['macro avg']['recall'],
                           "f1_score_macro":results_d['macro avg']['f1-score'],
                           "f1_score_weighted":results_d['weighted avg']['f1-score']})
            
            
    df = pd.DataFrame.from_records(results)
    df.to_csv(csv_file)
    
    

def main():
    fire.Fire(process_data)

if __name__ == "__main__":
    main()
