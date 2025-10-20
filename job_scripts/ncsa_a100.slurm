#!/bin/bash

#SBATCH --account=xxxx-delta-gpu # fill out xxxx with your allocation
#SBATCH --partition=gpuA100x4
### NODE/CPU/MEM/GPU  ###
#SBATCH --mem=0
#SBATCH --cpus-per-gpu=16
