from transformers import Qwen2AudioForConditionalGeneration, AutoProcessor, BitsAndBytesConfig
from datasets import load_from_disk
from sklearn.metrics import classification_report
from sklearn.metrics import classification_report
import pandas as pd
import torch
import os
import fire

if torch.cuda.is_available():
    device = torch.device('cuda')
else:
    device = torch.device('cpu')

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
    generate_ids = model.generate(**inputs, max_length=1024)
    generate_ids = generate_ids[:, inputs.input_ids.size(1):] # to get only the generated text
    response = processor.batch_decode(generate_ids, skip_special_tokens=True, clean_up_tokenization_spaces=False)[0]
    return response

def detect_CI_batch(batch, prompt, model, processor):
    audio = batch['audio']["array"]
    response = prompt_with_audio(audio, prompt, model, processor)
    batch['response'] = response
    if "MCI" in response:
        batch['dx_pred'] = "MCI"
    elif "NC" in response:
        batch['dx_pred'] = "NC"
    else:
        batch['dx_pred'] = "Unknown"
    return batch

def get_class_results(data, ref_col, pred_col):
    return classification_report(data[ref_col], data[pred_col], output_dict=True) 

def load_prompts(prompts_file):
    with open(prompts_file) as f:
        prompts = f.read().splitlines()
    return prompts

def process_data(dataset_path, prompts_file, output_dir):
    create_directory_if_not_exists(output_dir)
    csv_file = os.path.join(output_dir, "results.csv")
    pred_dataset_path = os.path.join(output_dir, "pred_dataset")
    create_directory_if_not_exists(pred_dataset_path)
    
    #Loading the model
    quantization_config = BitsAndBytesConfig(load_in_8bit=True)
    processor = AutoProcessor.from_pretrained("Qwen/Qwen2-Audio-7B-Instruct")
    model = Qwen2AudioForConditionalGeneration.from_pretrained("Qwen/Qwen2-Audio-7B-Instruct", quantization_config=quantization_config, device_map=device)
    model.tie_weights()
    print(f"Model loaded to device {model.device}")
    data = load_from_disk(dataset_path)
    prompts = load_prompts(prompts_file)
    results = []
    #pred_dataset = []
    for i in range(len(prompts)):
        prompt = prompts[i]
        print(prompt)
        data_pred = data.map(detect_CI_batch, fn_kwargs={'prompt': prompt,'model':model, 'processor':processor});
        #pred_dataset.append(deepcopy(data_pred))
        data_pred.remove_columns(['audio']).save_to_disk(os.path.join(pred_dataset_path,f'data_prompt_{i}'))
        results_d = get_class_results(data_pred, 'dx','dx_pred')
        results.append({"prompt":prompt, 
                        "MCI_recall":results_d["MCI"]["recall"],
                       "MCI_precision":results_d["MCI"]["precision"],
                       "MCI_f1-score":results_d["MCI"]["f1-score"],
                       "MCI_support":results_d["MCI"]["support"],
                       "NC_recall":results_d["NC"]["recall"],
                       "NC_precision":results_d["NC"]["precision"],
                       "NC_f1-score":results_d["NC"]["f1-score"],
                       "NC_support":results_d["NC"]["support"],
                       "f1_score_macro":results_d['macro avg']['f1-score'],
                       "f1_score_weighted":results_d['weighted avg']['f1-score']})
    df = pd.DataFrame.from_records(results)
    df.to_csv(csv_file)
    
    

def main():
    fire.Fire(process_data)

if __name__ == "__main__":
    main()
