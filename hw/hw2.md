# CME 257 Homework 2
Due Sunday 1/21 at 12 noon.

Please submit the assignment in a IJulia notebook (.ipynb), and put the type and function definitions in a module.  Please use a Julia v0.6.2 kernel (you can change the kernel in the drop-down kernel menu).

Name your ipynb "lastname_hw2.ipynb" and the module "lastname_hw2.jl".  The .ipynb should include the module assuming the module is in the same folder.

Email your .ipynb and module to bjnelson@stanford.edu with subject "cme 257 hw 2 submission"

The first 4 parts should be fairly straightforward based on the material covered in the second class.  Part 5 is a bonus question, meaning you should only do it if you find it interesting.  

---

In this homework you'll see a simple application of Julia's type system and multiple-dispatch functions to a common scientific computing problem: matrix multiplication.  

A matrix encodes a linear transformation between vector spaces.  In scientific computing, they generally appear as a m x n array of numbers.  Matrix-vector multiplication takes O(mn^2) time when the matrix is stored in this form, but some matrices have simple structure that we can use to make multiplication much faster.  One example is a [diagonal matrix](https://en.wikipedia.org/wiki/Diagonal_matrix), which is zero everywhere but the diagonal, and will simply scale entries of a vector. Another is a [rank-1 matrix](https://en.wikipedia.org/wiki/Rank_(linear_algebra)), which can be stored as the outer product of two vectors.  We'll use both of these in this assignment.  To simplify things as much as possible, assume all matrices are square.

---

* (Part 1) create an abstract cme257matrix type.
* (Part 2) Here is some code to define a cme257rank1 type, and vector multiplication:

```julia

struct cme257rank1{T} <: cme257matrix
    ## a rank-1 matrix type
    # A = u*v'
    # m is size of matrix
    u::Array{T, 1}
    v::Array{T, 1}
    m::Int64
end

function cme257rank1{T}(u::Array{T, 1}, v::Array{T, 1})
    # a special constructor for cme257rank1
    @assert length(u) == length(v) # we're only dealing with square matrices
    return cme257rank1(u, v, length(u))
end

import Base.*
function *{T}(A::cme257rank1{T}, v::Array{T,1})
    @assert A.m == length(v) # make sure vector is right size for matrix
    c = dot(A.v, v)
    return copy(A.u) * c
end
```
copy and paste the code, construct a cme257rank1 matrix, and verify that you can use it to multiply with a vector.  The following functions might help:

~~~julia
randn(10) # generates a random vector of length n
ones(10) # generates a vector of all ones of length n
~~~

* (Part 3) create a cme257diagonal type, which behaves like a diagonal matrix:
  1. it should be parameterized by T
  2. it should be a child of cme257matrix
  3. it should have two fields: "d" which is a m x 1 array of entries on the diagonal, and "m" which is the size of the matrix.
  4. create a special constructor for cme257diagonal which only takes a vector (m x 1 array), and infers m from its length.
  5. Add a method to the ```* ``` function which allows you to multiply a vector (m x 1 array) with a cme257diagonal matrix.  remember to check that the size matches! (hint: " .* " behaves like it does in MATLAB)

  verify that your special constructor and matrix multiplication work as expected.

  (Aside) You essentially just implemented Julia's native Diagonal type.  Look at the first few lines of code [here](https://github.com/JuliaLang/julia/blob/master/base/linalg/diagonal.jl). Julia has several [special matrix types](https://docs.julialang.org/en/latest/manual/linear-algebra/#Special-matrices-1), which you can use for better storage and better performance if your application allows.

* (Part 4) Now, we're going to create a plot that compares how fast multiplication is with a regular matrix versus one of our special matrices.
  1. Choose one of cme257diagonal or cme257rank1
  2.  Use PyPlot (or another plotting package) to plot the time it takes to complete multiplication for m in [10, 50, 100, 500, 1000] for both cme257diagonal and a full matrix.

  Hints:
  * cme257rank1(ones(m), ones(m)) is the same matrix (in the linear operator sense) as ones(m, m)
  * you can construct a full diagonal matrix in Julia with
  ```julia
  full(Diagonal(randn(m)))
  ```

  * to time something, wrap it with tic() and toq():
  ```julia
  tic()
  # do something here
  t = toq() # saves the time to do something
  ```

* [bonus] (Part 5) Finding the top [eigenvector](https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors) of a matrix (by top eigenvector, I mean the eigenvector with largest magnitude eigenvalue).  One method of computing the top eigenvector of a matrix is the [power iteration](https://en.wikipedia.org/wiki/Power_iteration).  A version of the power iteration is written in pseudocode below

```
Input:
A = m x m matrix
Output:
v = m x 1 vector
Alg:
v = random m x 1 vector
vprev = m x 1 vector of zeros
while ( v != vprev)
  vprev = copy(v)
  v = A * vprev
  v = v/norm(v)
end while
return v
```

write a single function that takes either of the cme257matrix children as input and uses the power iteration to compute the top eigenvector.  To avoid some issues, just stick to symmetric matrices. Test it on 10 x 10 matrices.

for the v != vprev check, try using

```julia
!isapprox(v, vprev)
```
