# Worksheet 2: Functions

1. What happens if instead of parameterizing a function like
```julia
function yell_my_type{T <: Number}(x::T)
  ...
end
```
We tried to do the same thing with:
```julia
function yell_my_type(x <: Number)
  ...
end
```
What's going on?  Can you think of other ways we might try to write a function that applies to many types?

2. Overload the addition and multiplication operators to do element-wise addition and multiplication on cme257OrderedPair.

3. (If you have time) - Overload the addition and multiplication operators for the Quaternion type.  You can read about Quaternions [here](https://en.wikipedia.org/wiki/Quaternion).
