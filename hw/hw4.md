# CME 257 HW 4 - Julia Sets

Due Sunday 2/18/18 by midnight.  Send an ipynb to bjnelson@stanford.edu.

## Julia Sets

Consider a rational function in the complex plane R(z) = P(z)/Q(z) where P, Q are polynomials without common divisors.  Let S be the set of points z in the complex plane that do not approach infinity after having R repeatedly applied.  That is

R(R(...R(z)...))

does not go to infinity. Julia sets are the boundary of S.

[Wikipedia definition](https://en.wikipedia.org/wiki/Julia_set)

[Wolfram mathworld definition](http://mathworld.wolfram.com/JuliaSet.html)

[Julia Jewels](http://mcgoodwin.net/julia/juliajewels.html)

Julia sets and the [Mandelbrot set](https://en.wikipedia.org/wiki/Mandelbrot_set) are closely related - the Mandelbrot set is the set of complex numbers c such that 0 does not diverge to infinity under the map z^2 + c.

## Visualizing Julia Sets

### Compute if points diverge

In this assignment, you'll write a function to allow someone to visualize a Julia set.  We won't worry about finding points on the boundary of S, but the simpler problem of finding points that haven't diverged beyond some given size after some given number of iterations.

You should write a function with the following properties:

Input:
* R - a rational function on the complex numbers (or just a function).
* x - a 1-D array of grid points on the real line
* y - a 1-D array of grid points on the imaginary line
* n_iter - the maximum number of iterations on a point (set a reasonable default)
* escape_tol - if the norm of a point goes beyond this tolerance, consider it gone to infinity (set a reasonable default)

Output:
* An array A of size(x) by size(y), where A[ i,j ] is the number of iterations it took z = x[ i ] + 1im * y[ j ] to surpass the escape_tol parameter in norm.  If the point did not escape, set A[ i,j ] to escape_tol + 1.

Parameterize your function on a type T (T should be a Real type) that lets you change the precision of your computations.  (the reason: look at how [complex is defined](https://github.com/JuliaLang/julia/blob/master/base/complex.jl))

### Performance

Use some of the things we talked about in class 6 to make your function fast.  There are a couple ways to think about doing this - broadcasting, loop macros, etc.  Use the profiler if you're stuck.


###  Visualize your results

Once you have your function working, visualize the array that you produce.  Try to find some interesting examples.

## Tips

If you don't know where to get started with the function, here's some basic pseudo code that may or may not perform well:

```
A = zeros(length(x), length(y))
for i in 1:length(x)
  for j in 1:length(y)
    z = x[i] + im * y[j]
    for k in 1:n_iter
      z = R(z)
      if abs(z) > escape_tol # diverged
        A[i,j] = k
        break
      end
    end
    if A[i,j] == 0 # didn't diverge
      A[i,j] = n_iter + 1
    end
  end
end

```

## Acknowledgements

CME 196 - Practical Fortran, developed and taught by Anders Petersen, included a an assignment on visualizing the Mandelbrot set, which is what inspired this assignment.
