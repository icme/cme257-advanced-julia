# CME 257 Homework 5
Due Sunday 11/24 at 11:59 pm.

Please submit the assignment in a IJulia notebook (.ipynb). Name your ipynb "lastname_hw5.ipynb". This assignment shouldn't take you more than 30 minutes.

Email your .ipynb to jmblpati@stanford.edu with subject "cme 257 hw 5 submission"

---

In this homework you'll implement some simple utility macros. 

* (Part 1) Julia lacks an `until` keyword in its basic functionality. This may be occasionally useful however: you may want to write code that loops until some invariant fails. For example, we may ask that the following code
```julia
i = 1
until i > 1000
  println(i)
  global i *=2
end
```
prints the powers of 2 less than 1000. In this exercise we will implement this macro. Fill in the below code snippet to implement the @until macro:
```julia
macro until(condition,codeblock)
    return quote
    #your code here
    end
end
```
We recall that macros can (but do not have to) return expressions in Julia just like functions. However, as we would like to generate some code to run with our `@until` macro we would like to return an `Expr`. We do this by returning some code nested in a `quote` block: this is of `Expr` type. You may test your macro with
```julia
i = 1
@until i > 1000 begin
  println(i)
  global i *=2
end
```
Your macro should print the powers of 2 from 1 to 512 inclusive. (The syntax `begin... end` allows us to provide Julia with a block of code over multiple lines.) Be mindful of escaping the variable names `condition` and `codeblock`!

* (Part 2) We'll now implement a macro to do _list comprehensions_. A list comprehension is a convenient way to call `map()` in Julia. You may know them from the `f.(x)` syntax:
```julia
function f(x)
  x^2
end

f.(collect(0:10))
```

This returns the list of perfect squares between 0 and 100. Implement a macro form of this by completing the code below

```julia
macro lcomp(f,rangestart,rangeend)
    return quote
    #your code here
    end
end
```

Your may test your code with
```julia
@lcomp f 0 10
```
(A hint: you'll need to call the arguments  `f, rangestart, rangeend` with `$`. You can query `f` at a point `i` with `$(f)(i)`. )

* (Part 3) Implement a function `lcomp2` which is a function version of the `lcomp` macro from part 2. Using `f(x) = x^2`, compare the running times of 
1. @lcomp f 0 10000
2. lcomp2(f,0,10000) without precompiling 
3. lcomp2(f,0,10000) after precompiling 

Is there a significant performance difference? Write a brief explanation of any effect you observe. 

