#!/bin/bash

#SBATCH --account=xxxx-dtai-gh # fill out xxxx with your allocation
#SBATCH --partition=ghx4
### NODE/CPU/MEM/GPU  ###
#SBATCH --mem-per-cpu=1G
#SBATCH --cpus-per-gpu=72

# for multinode debugging uncomment below and put in job script
# export NCCL_DEBUG=INFO

# for fast multinode uncomment below commands and put in job script
# module load libfabric/2.3.1             
# module load nccl-ofi-plugin/1.18.0-cuda129
