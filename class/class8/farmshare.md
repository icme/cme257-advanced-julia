# Connecting to Farmshare

https://web.stanford.edu/group/farmshare/cgi-bin/wiki/index.php/FarmShare_2

For class 8, we'll be talking about parallelism.  We'll use farmshare to have access to a computing cluster.

To connect to a login node, open up a terminal, and ssh into `rice.stanford.edu`.  In everything that follows, replace `suid` with your Stanford University ID

```
ssh suid@rice.stanford.edu
```

you can put Julia v0.6.2 on your path using
```
module load julia
```

## Interactive GPU Session

once you are on a login node (rice), you can request an interactive session on a gpu node (you may need to wait for resources to become available)
```
srun --pty --partition=gpu --gres=gpu:1 --qos=interactive $SHELL -l
```

Now, you should see that you're on an Oat node, which is a gpu node.  I've custom built julia to run on these nodes.  To use this, try
```
module use /farmshare/user_data/cme257/modules
module load julia/0.6.2-cme257
```
now, the `julia` command should point to the custom-built binary.  Note that you won't be able to add new packages, but you should be able to use existing ones.

# Connecting to icme-gpu

https://icme.stanford.edu/resources/hpc-compute-resources/icme-cluster
