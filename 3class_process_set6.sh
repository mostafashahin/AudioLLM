CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set6_zero_shot_CoT.txt results/exp82 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set6_zero_shot_CoT.txt results/exp83 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set6_zero_shot_CoT.txt results/exp84 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set6_zero_shot_CoT.txt results/exp85 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set6_zero_shot_CoT.txt results/exp86 --task=PFT --n_classes=3
CUDA_VISIBLE_DEVICES=2 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set6_zero_shot_CoT.txt results/exp87 --task=PFT --n_classes=3
