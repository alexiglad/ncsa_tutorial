#!/bin/bash
#SBATCH --account=xxxx-dtai-gh
#SBATCH --partition=gpuA100x4
#SBATCH --mem-bind=verbose,local
#SBATCH --gpu-bind=verbose,closest
#SBATCH --mem-per-cpu=3G

### ADDITIONAL RUN INFO ###
#SBATCH --array=0
#SBATCH --time=0:01:00
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1 # NOTE if are changing this may need to also change num cpus requested
#SBATCH --cpus-per-task=16

### LOG INFO ###
#SBATCH --job-name=ebwm-medium-default
#SBATCH --output=logs/slurm/random/ebwm-medium-default%A-%a.log
mkdir -p logs/slurm/random/
python3 -c "print('Hello, world!')"