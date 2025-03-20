CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set10_zero_shot_No_CoT_Formative_CTD.txt results/exp94 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set10_zero_shot_No_CoT_Formative_CTD.txt results/exp95 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set10_zero_shot_No_CoT_Formative_SFT.txt results/exp96 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set10_zero_shot_No_CoT_Formative_SFT.txt results/exp97 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set10_zero_shot_No_CoT_Formative_PFT.txt results/exp98 --task=PFT --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set10_zero_shot_No_CoT_Formative_PFT.txt results/exp99 --task=PFT --n_classes=3
