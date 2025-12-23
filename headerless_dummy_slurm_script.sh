### ADDITIONAL RUN INFO ###
#SBATCH --array=0
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --ntasks-per-node=1

### LOG INFO ###
#SBATCH --job-name=model_name-size-config
#SBATCH --output=logs/slurm/model_name-size-config%A-%a.log
export RUN_NAME="model_name-size-config"
# NOTE ctrl d ALL THREE of above to modify job-name, output, and RUN_NAME (which should all be the same)
export MODEL_NAME="${RUN_NAME%%-*}"
export MODEL_SIZE="${RUN_NAME#*-}"; export MODEL_SIZE="${MODEL_SIZE%%-*}"
mkdir -p logs/slurm/
module purge