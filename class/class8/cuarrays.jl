# Demonstration of CuArrays package
# allows you to put arrays on GPUs and use CUDA

using CuArrays

# matrix size
n = 1000
A_cpu = randn(n,n)

A_gpu = cu(A_cpu)

# run once for JIT
B_cpu = A_cpu * A_cpu;
@time B_cpu = A_cpu * A_cpu;

# run once for JIT
B_gpu = A_gpu * A_gpu;
@time B_gpu = A_gpu * A_gpu;

# put B_gpu back on CPU
C = collect(B_gpu);
