#!/bin/bash

#SBATCH --account=xxxx-delta-gpu # fill out xxxx with your allocation
#SBATCH --partition=gpuA100x4
### NODE/CPU/MEM/GPU  ###
#SBATCH --mem-bind=verbose,local
#SBATCH --gpu-bind=verbose,closest
#SBATCH --mem-per-cpu=3G
#SBATCH --cpus-per-task=64