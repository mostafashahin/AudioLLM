CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_zero_shot_No_CoT.txt results/exp40 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_zero_shot_No_CoT.txt results/exp41 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_zero_shot_No_CoT.txt results/exp42 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_zero_shot_No_CoT.txt results/exp43 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_zero_shot_No_CoT.txt results/exp44 --task=PFT --ci=True
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_zero_shot_No_CoT.txt results/exp45 --task=PFT --ci=True
