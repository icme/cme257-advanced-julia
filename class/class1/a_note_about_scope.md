# A Note about Scope

In Julia, the scope of variables can change depending on where you run your code. Code that runs in an IJulia notebook may sometimes fail to run in the REPL or when calling Julia from the command line.


# The Issue

In short, Julia by default restricts scope: If I define a variable ``` x ``` outside of a loop and want to change ``` x ```'s variable inside of a loop, Julia will throw an error:

```
x = 1
for i in 1:10
    x+= 1 
end
println(x)
```
in the REPL or in a script returns

```
ERROR: UndefVarError: x not defined
Stacktrace:
 [1] top-level scope at ./REPL[2]:2
```

However, in an IJulia notebook all variables are considered to have "global" scope: they can be accessed and changed at all times by anything. Thus the above code runs without issue in a notebook: it returns ``` 11 ``` as you might expect. 

The reason for this difference is that in Julia loops and functions are by default only allowed write-access to variables defined within "local scope" (they can read from anywhere). Julia posesses two scopes: "global" and "local". Global scope is seen on the REPL and by default in Julia, while local scope is entered in functions, loops, macros, and comprehensions (which we haven't discussed yet). You may notice that since there are only two scopes, the rules stated above allow for a variable defined in an outer loop to be modified in an inner one. Indeed, this is the case:

```
for i = 1:1
    z = i
    for j = 1:1
        z = 0
    end
    println(z)
end
```

prints ``` 0 ``` on both the REPL and in IJulia as expected. 

As mentioned, reading from variables outside of a loop or function is supported:

```
w = 2
for i = 1:1
    println(w)
end
```
simply prints ```w```'s value of ```1```.

The reason this issue doesn't arise in IJulia is that IJulia notebooks by default enforce global scope everywhere through the package ```SoftGlobalScope```. You can imagine how restrictive scoping like this might break a cell-based model of programming like a notebook.

# Fixing the Issue

To fix this issue, there are two easy options:

1. Use IJulia notebooks.
2. Use the keyword ```global```.

Although Julia will not allow us to modify an out-of-scope variable by default, we can force it to let us with the keyword ```global```. As an example,

```
x = 1
for i in 1:10
    global x+= 1 
end
println(x)
```
returns ``` 11``` just as it did on the REPL. ```global``` tells Julia to look for the variable ```x``` in its global memory and modify it. The reason for this subtlety is performance: if Julia's compiler can guarantee that all but a few variables in memory will not be changed inside a loop or a function, it can optimize much more aggressively than otherwise. We will go into more depth when we talk about optimizing Julia code.


## Arrays
You might notice that this does not come up with arrays at all. Indeed, the code

```
x = [1 1]
for i = 1:2
    x[i] += 1
end
println(x)
```

runs as expected and prints ```[2 2]``` on the REPL. However, we are not really modifying the array ```x``` here: we are simply changing the entries that ```x``` points to in memory. This is independent of local or global scope. If we tried to change the array ```x``` itself we would run into issues:

```
x = [1 1]
for i = 1:1
    x = [2 2]
end
println(x)
```
runs into errors. Other data structures which serve as pointers to their entries (like dicts and queues) work in the same way.
