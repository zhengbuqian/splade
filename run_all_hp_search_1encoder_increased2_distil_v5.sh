#!/bin/bash
#SBATCH -n 1
#SBATCH -p gpu
#SBATCH --job-name=distilv5
#SBATCH --output=logs/msmarco_all_1encoder_adaptertune_distil_hp_flops_ld9e5_v5_resume.log
#SBATCH --error=logs/msmarco_all_1encoder_adaptertune_distil_hp_flops_ld9e5_v5_resume.err
#SBATCH --gres=gpu:4
#SBATCH --cpus-per-task=4
#SBATCH --constraint="gpu_32g"
#SBATCH --mem=200G

scontrol show job ${SLURM_JOB_ID}
DIRECTORY=${SLURM_SUBMIT_DIR}  # must be IndynIR !

source ~/.bashrc
conda activate splade
export PYTHONPATH=$PYTHONPATH:$(pwd)
export SPLADE_CONFIG_NAME="config_splade_msmarco_adapters_regularization_increased2_distil_v5.yaml"  #"config_splade.yaml"
python3 -m splade.all 