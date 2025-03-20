CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_zero_shot_No_CoT.txt results/exp70 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_zero_shot_No_CoT.txt results/exp71 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_zero_shot_No_CoT.txt results/exp72 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_zero_shot_No_CoT.txt results/exp73 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_zero_shot_No_CoT.txt results/exp74 --task=PFT --n_classes=3
CUDA_VISIBLE_DEVICES=0 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_zero_shot_No_CoT.txt results/exp75 --task=PFT --n_classes=3
