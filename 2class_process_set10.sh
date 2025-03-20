CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set10_zero_shot_No_CoT_Formative_CTD.txt results/exp64 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set10_zero_shot_No_CoT_Formative_CTD.txt results/exp65 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set10_zero_shot_No_CoT_Formative_SFT.txt results/exp66 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set10_zero_shot_No_CoT_Formative_SFT.txt results/exp67 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set10_zero_shot_No_CoT_Formative_PFT.txt results/exp68 --task=PFT --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set10_zero_shot_No_CoT_Formative_PFT.txt results/exp69 --task=PFT --ci=True
