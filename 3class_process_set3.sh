CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set3_Zero_Shot_No_CoT_Formative_CTD.txt results/exp76 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set3_Zero_Shot_No_CoT_Formative_CTD.txt results/exp77 --task=CTD --n_classes=3
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set3_Zero_Shot_No_CoT_Formative_SFT.txt results/exp78 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set3_Zero_Shot_No_CoT_Formative_SFT.txt results/exp79 --task=SFT --n_classes=3
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/train/ prompts/3-class/prompts_set3_Zero_Shot_No_CoT_Formative_PFT.txt results/exp80 --task=PFT --n_classes=3
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset/test/ prompts/3-class/prompts_set3_Zero_Shot_No_CoT_Formative_PFT.txt results/exp81 --task=PFT --n_classes=3
