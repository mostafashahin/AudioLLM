CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set3_Zero_Shot_No_CoT_Formative_CTD.txt results/exp46 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set3_Zero_Shot_No_CoT_Formative_CTD.txt results/exp47 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set3_Zero_Shot_No_CoT_Formative_SFT.txt results/exp48 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set3_Zero_Shot_No_CoT_Formative_SFT.txt results/exp49 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set3_Zero_Shot_No_CoT_Formative_PFT.txt results/exp50 --task=PFT --ci=True
CUDA_VISIBLE_DEVICES=1 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set3_Zero_Shot_No_CoT_Formative_PFT.txt results/exp51 --task=PFT --ci=True
