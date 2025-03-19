CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set7_zero_shot_CoT_Formative_CTD.txt results/exp58 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set7_zero_shot_CoT_Formative_CTD.txt results/exp59 --task=CTD --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set7_zero_shot_CoT_Formative_SFT.txt results/exp60 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set7_zero_shot_CoT_Formative_SFT.txt results/exp61 --task=SFT --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/train/ prompts/2-class/prompts_set7_zero_shot_CoT_Formative_PFT.txt results/exp62 --task=PFT --ci=True
CUDA_VISIBLE_DEVICES=3 python Qwen_zero_shot.py ../Dataset/PROCESS_dataset_2class/test/ prompts/2-class/prompts_set7_zero_shot_CoT_Formative_PFT.txt results/exp63 --task=PFT --ci=True
