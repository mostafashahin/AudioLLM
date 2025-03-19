CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set6_zero_shot_CoT.txt results/exp52 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set6_zero_shot_CoT.txt results/exp53 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set6_zero_shot_CoT.txt results/exp54 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set6_zero_shot_CoT.txt results/exp55 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set6_zero_shot_CoT.txt results/exp56 --task=PFT --ci=True
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set6_zero_shot_CoT.txt results/exp57 --task=PFT --ci=True
