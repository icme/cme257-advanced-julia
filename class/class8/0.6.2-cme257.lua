whatis("Name:        Julia")
whatis("Version:     0.6.2-cme257")
whatis("Category:    utilities, compilers, languages")
whatis("Keywords:    utility, compiler, language, Julia")
whatis("URL:         https://julialang.org")
whatis("Description: A high-level, high-performance, dynamic programming language for numerical computing.  This software has been custom-built for CME257 to use on the Farmshare GPU cluser.")

load("cudnn/7.0.5")

prepend_path("PATH","/farmshare/user_data/cme257/software/src/julia-gpu/usr/bin")
prepend_path("LD_LIBRARY_PATH","/farmshare/user_data/cme257/software/src/julia-gpu/usr/lib")
prepend_path("CPATH","/farmshare/user_data/cme257/software/src/julia-gpu/usr/include")
prepend_path("JULIA_PKGDIR","/farmshare/user_data/cme257/software/julia/packages")
