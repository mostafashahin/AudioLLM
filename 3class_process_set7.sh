CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set7_zero_shot_CoT_Formative_CTD.txt results/exp88 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set7_zero_shot_CoT_Formative_CTD.txt results/exp89 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set7_zero_shot_CoT_Formative_SFT.txt results/exp90 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set7_zero_shot_CoT_Formative_SFT.txt results/exp91 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set7_zero_shot_CoT_Formative_PFT.txt results/exp92 --task=PFT --n_classes=3
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set7_zero_shot_CoT_Formative_PFT.txt results/exp93 --task=PFT --n_classes=3
