alias slurm-blame='squeue -h -t R -o "%u|%N" | while IFS="|" read u n; do scontrol show hostnames "$n" | sed "s/^/$u /"; done | sort -u | awk '\''{count[$1]++} END {for (u in count) print u, count[u]}'\'' | sort -k2 -nr'
alias node-queue='squeue -h -t PD,R -o "%u|%b|%D" | awk -F"\|" '\''match($2,/gpu(:|=)?([0-9]+)/,m){sum[$1]+=$3} END{for(u in sum) printf "%-18s %d\n",u,sum[u]}'\'' | sort -k2,2nr'
alias sque='squeue -u $USER'
alias sques='squeue -u $USER --start'
alias squel='squeue -u $USER -o "%.18i %.9P %.150j %.8u %.2t %.10M %.4D %.0R"'
alias squesl='squeue -u $USER --start -o "%.18i %.9P %.150j %.8u %.2t %.19S %.4D %.0R"'
alias squet='squeue -u "$USER" -o "%.18i %.8j %.2t %.10M %.10l %R"'

# TODO replace all XXXX---set the account, partition, mem-per-cpu, and cpus-per-gpu according to your cluster memory per cpu and cpus per gpu
# can make the two below interactive if cluster supports it
alias srun_1h="srun --account=XXXX --partition=XXXX --time=1:00:00 --nodes=1 --mem-per-cpu=XXXXG --cpus-per-gpu=XXXX --gpus-per-node=1 --pty /bin/bash"
alias srun_2h="srun --account=XXXX --partition=XXXX --time=2:00:00 --nodes=1 --mem-per-cpu=XXXXG --cpus-per-gpu=XXXX --gpus-per-node=1 --pty /bin/bash"
alias srun_12h="srun --account=XXXX --partition=XXXX --time=12:00:00 --nodes=1 --mem-per-cpu=XXXXG --cpus-per-gpu=XXXX --gpus-per-node=1 --pty /bin/bash"
alias srun_24h="srun --account=XXXX --partition=XXXX --time=24:00:00 --nodes=1 --mem-per-cpu=XXXXG --cpus-per-gpu=XXXX --gpus-per-node=1 --pty /bin/bash"

check_credit() {
    sacct -j "$1" -o JobID,AllocTRES%50
}

# gcloud stuff, TODO set the correct dir
# source /work/hdd/bcsi/agladstone/misc/google-cloud-sdk/completion.bash.inc
# source /work/hdd/bcsi/agladstone/misc/google-cloud-sdk/path.bash.inc
