# some answers for the pi monte-carlo question

function π_monte_carlo(n_samples::Int64)
    n_circle = 0
    for i=1:n_samples
        x = rand() * 2 - 1
        y = rand() * 2 - 1
        r2 = x^2 + y^2
        if r2 <= 1
            n_circle += 1
        end
    end
    return (n_circle / n_samples) * 4
end

@everywhere function π_monte_carlo_simd(n_samples::Int64)
    n_circle = 0
    @simd for i=1:n_samples
        x = rand() * 2 - 1
        y = rand() * 2 - 1
        r2 = x^2 + y^2
        if r2 <= 1
            n_circle += 1
        end
    end
    return (n_circle / n_samples) * 4
end



function π_monte_carlo_parallel(n_samples::Int64)
    n_circle = @parallel (+) for i=1:n_samples
        x = rand() * 2 - 1
        y = rand() * 2 - 1
        r2 = x^2 + y^2
        Int64(r2 <= 1)
    end
    return (n_circle / n_samples) * 4
end

function π_monte_carlo_parallel_simd(n_samples::Int64)
    num_proc = nprocs()
    n_per_proc = div(n_samples, num_proc)
    jobs = []
    # create a job on each worker process
    for proc = num_proc:-1:2
        push!(jobs, @spawnat proc π_monte_carlo_simd(n_per_proc) )
    end
    #n_circle = remotecall_fetch(π_monte_carlo_simd, 1, n_per_proc + mod(n_samples, num_proc))
    # call on the master process as well
    n_circle = π_monte_carlo_simd(n_per_proc + mod(n_samples, num_proc))
    for proc = num_proc:-1:2
        n_circle += fetch(pop!(jobs))
    end
    return n_circle/num_proc
end
;

n = 100000000
@show n
println("Naive Monte Carlo")
@time a1 = π_monte_carlo(n)
@show a1
println("SIMD Monte Carlo")
@time a2 = π_monte_carlo_simd(n)
@show a2
println("Parallel Monte Carlo")
@time a3 = π_monte_carlo_parallel(n)
@show a3
println("Parallel SIMD Monte Carlo")
@time a4 = π_monte_carlo_parallel_simd(n)
@show a4
