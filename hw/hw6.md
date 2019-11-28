# CME 257 Homework 6
Due Friday 12/5 at 11:59 pm.

Please submit the assignment in a IJulia notebook (.ipynb). Name your ipynb "lastname_hw5.ipynb". This assignment shouldn't take you more than 90 minutes.

Email your .ipynb to jmblpati@stanford.edu with subject "cme 257 hw 6 submission"

---

In this homework you'll use Julia 1.3.0 to write some multithreaded code for some classic algorithms.

* (Part 0) Install Julia 1.3.0 on your machine, and start it with 4 threads. If you are having problems with this please let me know.

* (Part 1) Here are two implementations of the discrete Fourier transform:
```julia
function DFTslow(x)
    N = length(x)
    v = collect(0:N-1)
    M = exp.(-2*im*pi*v*v'/N)
    return M*x
end

function DFTfaster(x)
    N = length(x)
    if N%2 != 0 
        println("N needs to be a power of 2")
    elseif N <= 32
        return DFTslow(x)
    end
    x_even = DFTfaster(x[1:2:end])
    x_odd = DFTfaster(x[2:2:end])
    f  = exp.(-2*im*pi*collect(0:(div(N,2)-1))/N)
    y_even = x_even + f.*x_odd
    y_odd = x_even - f.*x_odd
    return vcat(y_even,y_odd)
end
```
Install the package `FFTW.jl` and verify that these implementations are correct. Try computing the DFT of a sum of sime waves to see if you can recover the linear combination of waves that they are composed of.

* (Part 2) Modify `DFTfaster` to use multiple threads. Benchmark your implementation against `DFTfaster` and `FFTW.jl`'s implementation on random vectors.

* (Part 3) Try using the `@simd` macro or thread-local storage to improve your code's memory usage and speed even more. Did it have any effect?

* (Part 4) The [prefix sum](https://en.wikipedia.org/wiki/Prefix_sum) operation is a classic primitive in parallel algorithms. A serial implementation is found in Julia as `cumsum`. Implement either of the algorithms from [here](https://en.wikipedia.org/wiki/Prefix_sum#Parallel_algorithms) in Julia. If you use only one thread, how does your implementation compare to `cumsum`?

* (Part 5) Write a multithreaded version of your prefix sum algorithm and compare it to `cumsum`. Try to optimize the point of tradeoff between recursing and running the serial algorithm: can you make your implementation faster than `cumsum`?
