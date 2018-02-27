# Cluster Setup Notes

CuArrays.jl requires Julia to be built from source on the machine it will be run on.  To save everybody from needing to do this themselves, as well as the cluster, the instructor built julia in
```
/farmshare/user_data/cme257/software/src/julia-gpu
```
while logged into a gpu node.

## Module File

A module file was created at
```
/farmshare/user_data/cme257/modules/julia/0.6.2-cme257.lua
```
which is [included](0.6.2-cme257.lua) in this directory.

Directions for loading the module can be found in [farmshare.md](farmshare.md).

## Julia Package Path

To save everyone from installing a copy of the packages in their home directories, the packages demoed in class were all installed by the instructor.  In order to over-ride default installation in the user home directory, `JULIA_PKGDIR` is set in the module file.

Since the `/farmshare/user_data/cme257/` directory is only writable by the instructor, this means everytyhing needs to be precomplied by the instructor.

In the package directory, which was set to be

```
/farmshare/user_data/cme257/software/julia/packages
```

check that the precompiled `*.ji` files have the correct permissions.  If not, the instructor may need to go into `packages/lib/` and
```
chmod 755 *.ji
```
