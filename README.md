## Tutorial (please watch below linked videos!!!)
* [Getting access to NCSA Resources](https://youtu.be/MSqiGmOxjJA)
* [Using NCSA Resources/GPUs](https://youtu.be/SnW_wO9H8K8) :)
* Xingyao/Qingyun tutorial (somewhat outdated, will update when I get time): https://docs.google.com/document/u/3/d/1SM9Fo0pd6x0DUwVoy5zJfRVqFXDCgwWP_Uw6lmtZ1PE/edit

## Helpful Commands, Tips, and Tricks
* Docs and main allocations:
	* [Delta](https://docs.ncsa.illinois.edu/systems/delta/en/latest/quick_start.html) (A100s, A40s, etc)
	* [DeltaAI](https://docs.ncsa.illinois.edu/systems/deltaai/en/latest/index.html) (GH200's which are better than H100's)
* helpful commands and info PLEASE READ THROUGH THEY ARE SUPER HELPFUL!!!
* `squeue -u $USER --start`
	* show when job starts
* `sinfo -s`  and the more details `sinfo` yields how many nodes are available/in use
	* working on making bash script work better to estimate available A100's
	* **A/I/O/T** stand for allocated, idle, other, and total
* [support request link](https://jira.ncsa.illinois.edu/servicedesk/customer/portal/2/create/47) 
* increase timeout for vscode to ensure can duo in time
* to see partitions/accounts can use
	* use `accounts` command
* to launch slurm script but still use conda env:
	* When using your own custom conda environment with a batch job, submit the batch job from within the environment and _do not_ add `conda activate` commands to the job script; the job inherits your environment.
	* **THIS IS VERY IMPORTANT**
- if using a jupyterlab session or vscode session do:
	- `unset SLURM_NTASKS`
	- prevents issues with [this](https://www.google.com/search?q=ytorch+lightning+RuntimeError%3A+You+set+%60--ntasks%3D48%60+in+your+SLURM+bash+script&rlz=1C5CHFA_enUS1125US1125&oq=ytorch+lightning+RuntimeError%3A+You+set+%60--ntasks%3D48%60+in+your+SLURM+bash+script&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBBzIzNmowajeoAgCwAgA&sourceid=chrome&ie=UTF-8) error
- for creating singularity container
	- may need to mount temp requirements to `tmp/requirements.txt`
	- may need to remove nvidia/triton from requirements
- cannot use mem-per-gpu, use mem-per-cpu instead
	- need integer value 
- can make reservations for lots of resources/different amounts of time if submit support ticket :)
- use `quota` and not df -h to get accurate file storage left
- `sacct` can show the compute allocated for a job
	- `sacct -j job_id --format=JobID,JobName,AllocCPUS,AllocTRES,ReqMem,MaxRSS,State`
- `scontrol show config` can show the controlled resources allowable to req
	- or similarly `scontrol show job job_id` can show important info about job, such as why crashed
- to do srun ijob in terminal (fill out xxxx with your allocation):
	- for GH200
		- `srun --account=xxxx-dtai-gh --partition=ghx4 --time=48:00:00 --mem-bind=verbose,local --gpu-bind=verbose,closest --nodes=1 --mem-per-cpu=1G --cpus-per-task=288 --gpus-per-node=4 --pty /bin/bash`
		- `srun --account=xxxx-dtai-gh --partition=ghx4-interactive --time=1:00:00 --mem-bind=verbose,local --gpu-bind=verbose,closest --nodes=1 --mem-per-cpu=1G --cpus-per-task=72 --gpus-per-node=1 --pty /bin/bash`
			- interactive
	- for A100 NCSA
		- `srun --account=xxxx-delta-gpu --partition=gpuA100x4 --time=48:00:00 --mem-bind=verbose,local --gpu-bind=verbose,closest --nodes=1 --mem-per-cpu=3G --cpus-per-task=64 --gpus-per-node=4 --pty /bin/bash`
		- `srun --account=xxxx-delta-gpu --partition=gpuA100x4-interactive --time=1:00:00 --mem-bind=verbose,local --gpu-bind=verbose,closest --nodes=1 --mem-per-cpu=3G --cpus-per-task=16 --gpus-per-node=1 --pty /bin/bash`
			- interactive
- gh200 env setup
	- see delta ai docs for pytorch version to install (nightly)
	- see this for triton install (courtesy of revanth) https://drive.google.com/file/d/162mESS9BOXDxWLzj--xRU_D2u1YsEtyc/view
		- if doesnt work the first time use setup.py to clean and retry
	- use loose_requirements
	- current xformers not compatible with installing triton, so cant do triton
	- for xformers (install after triton and pytorch and other packages)
		- `export TORCH_CUDA_ARCH_LIST="9.0"`
		- `pip install xformers==0.0.27.post2 --no-deps --no-cache-dir`
- need to use screen to run this to prevent dc
	- `screen -S session_name`
	- `screen -ls`
	- `echo $STY`
	- `Ctrl-a d`
	- `screen -r session_name`
	- `screen -S session_name -X quit`
	- `screen -d session_name`
		- for when screen says attached but cant access
	- `ctrl-a esc`
- slurm priority things
	- `scontrol show job <job_id> | grep Priority`
		- shows priority of specific job and its ID
	- `sprio`
		- then ctrl f in terminal, can show job priority relative to others
	- `sshare -l`
		- can ctrl f and see the fairshare and levelFS
- grad students can only request [discover](https://allocations.access-ci.org/project-types) or lower
	- profs can req accelerate
- for this error
	- FATAL:   While checking container encryption: could not open image /work/hdd/bcsi/agladstone/containers/pytorch_2.4.sif: the image's architecture (amd64) could not run on the host's (arm64)
		- need to swith dir and then rerun command...
    
**ZSH**
* this caused issue with both blender and NCSA
	* if want to use just manually open zsh terminal. otherwise use bash
