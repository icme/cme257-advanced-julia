function isprime(n::Int64) #reimplement an isprime function (with type delcarations!)
    for p = 2:round(Int,sqrt(n)) #only need to check to sqrt(n)
        if n%p == 0
            return false
        end
    end
    return true
end


function my_sieve(n::Int64)
  out = []
  for i = 2:n
        if isprime(i)
            append!(out,i)
        end
    end
    return out
end

println("Solution 1: ", sum(my_sieve(10000)))


function eratosthenes(n::Int64)
  out = fill(true,n) #we track the true-false values for whether the i^th number is prime: we will construct the sum of the primes less than 10000 later.
  out[1] = false # remove 1 from the set of primes
  for i = 2:round(Int,sqrt(n)) #only need to check to sqrt(n)
    if out[i]
      for index = 2*i:i:n
      out[index] = 0
    end
    end
  end
  return out
end


println("Solution 2: ", sum(collect(1:10000)[eratosthenes(10000)])) 
#Run these in IJulia to see which is really faster: both are bound primarily by compilation time.

#Here are two solutions by students that I thought were particularly good.

#Solution by Frederik Johan Mellbye

function get_primes(N)
    A = ones(Bool, N-1)
    A[1] = false

    for i in 2:round(Int, sqrt(N-1))
        if A[i]
            for j in (i^2):i:N-1
                A[j] = false
            end
        end
    end
    return collect(1:N-1)[A]
end

function sum_primes(N)
    return sum(get_primes(N))
end

@show sum_primes(10000)

#Solution by Sarah Hensley

function sieve(N)
    maxValue = ceil(Int,sqrt(N))
    A = fill(true,(N))
    A[1] = false
    for i in 2:maxValue
        if A[i]
            for j in collect(i^2:i:N)
                A[j] = false
            end
        end
    end
    return A
end

@show sum(collect(1:10000)[sieve(10000)]) 
