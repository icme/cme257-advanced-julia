# Getting Started

This document covers two ways to get started using Julia.  We'll use the most recent release, which is currently v0.6.2

## A note on Operating Systems

The vast majority of computing is performed on \*nix operating systems, the most familiar of which include Linux, OpenBSD, and MacOS.  A common feature on all these systems is the [bash shell](https://en.wikipedia.org/wiki/Bash_(Unix_shell)), often via a terminal.  If you aren't already familiar with the bash shell, use this course as an opportunity to get started - it will open up all sorts of computing resources to you.  This class will assume that you are using such a system.

To Windows users: Julia can be installed on Windows, but for the purposes of this course, you are encouraged to choose one of the following options:

0. [likely easiest] Use Ubuntu (a Linux distribution) inside Windows 10 - see [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
1. Obtain a Linux virtual machine.  You can try installing this on your computer, but many departments at Stanford offer them to students.
2. SSH into a \*nix computing resource, such as Farmshare 2.  For example, see [here](https://www.ssh.com/ssh/client) for some options.  
3. Dual boot your Windows machine with a \*nix operating system.

If you have significant development experience on Windows, you may be able to navigate the course with Julia on Windows.  However, the instructor will not be very useful for the purposes of troubleshooting any problems.

### If You're Unfamiliar with BASH

Don't worry - you don't need much for this course.  Many references can be found online, but [here's one quick reference](https://courses.cs.washington.edu/courses/cse390a/14au/bash.html).  

Once you can navigate the filesystem using the commands ```ls, cd, pwd, mkdir, rmdir```, you should be able to follow the instructions below.

## Installing Julia

We will be using the latest stable release of Julia in this class (at the time of writing, Julia 1.2.0). 

## Install on Your Computer

### Installing from Binaries

The easiest and recommended option is to [download Julia for your machine here](https://julialang.org/downloads/).  

#### Instructions for Mac OSX

On Macs, download the Julia .dmg file at [this link](https://julialang-s3.julialang.org/bin/mac/x64/1.2/julia-1.2.0-mac64.dmg). Open the disk image and copy the Julia executable to your Applications folder. Double click the application to launch Julia. Once here, you may add a symlink to this executable so that you can call Julia from the command line-- use the command
```
sudo ln -s /Applications/Julia-1.2.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia

``` 
#### Instructions for Debian/Ubuntu 

Download the correct file for your system at [the download link](https://julialang.org/downloads/). Extract the contents to a known folder on your computer (I suggest creating a folder at ```~/app```.) Once you have extracted the contents of the archive, open Terminal and run the magic words

```
cd /usr/local/bin
sudo ln -s {folder you extracted Julia to}/julia-1.2.0/bin/julia .
```

to create a symlink on the terminal. To run Julia, type ```julia``` into Terminal.

### Installing from Source

For advanced users, another option is to install from source.  This will get you started using git version control, and if you want to contribute to Julia down the road you'll be half way there. In earlier versions of Julia compiling your own copy of Julia would give you compiler optimizations not present in the official binaries: this is typically no longer the case though.

### Installing Julia From Source
Instructions can be found on the [Julia GitHub page](https://github.com/JuliaLang/julia#source-download-and-compilation)

1. [recommended] if you don't already have one, set up a [GitHub](https://github.com/) account - much of the Julia ecosystem lives on GitHub, and if you ever want to contribute you'll need an account
2. Open up a terminal on your machine
3. Create/choose a directory you would like your Julia build to live in, and clone the Julia repository
```
cd /your/path/
git clone git://github.com/JuliaLang/julia.git
```
4. checkout the current latest version
```
cd julia
git checkout v1.2.0
```
5. [optional] Configure Julia's build
6. build julia
```
make -j 4 # parallelizes build
```
The path to the Julia executable is now
```
/your/path/julia/julia
```
7. [optional] Edit your ```.bashrc``` file to allow you to start Julia from anywhere in your terminal.  There are several ways to achieve this, but one way is using an alias, e.g. see [here](https://askubuntu.com/questions/17536/how-do-i-create-a-permanent-bash-alias)

## Use on a Cluster

You may have a lab or department cluster you'd like to use.  Here we'll cover how to start Julia on Stanford's community computing cluster [Farmshare 2](https://srcc.stanford.edu/farmshare2)

1. ssh into Farmshare 2
```
ssh <suid>@rice.stanford.edu
```
Where ```<suid>``` is replaced by your stanford ID.  Follow the login prompts

2. The default version of Julia on rice is v0.5.2.  Since we want the most up-to-date version, we'll load the Julia module
~~~
module load julia
~~~
3. Launch Julia using
~~~
julia
~~~

## Now What?

When you call the ```julia``` command from the terminal or run the executable, you enter the interactive REPL (Read/Evaluate/Print/Loop).  You can read more [here](https://en.wikibooks.org/wiki/Introducing_Julia/The_REPL)

## Which Version of Julia am I Using?

Remember, we're going to use the current version (v1.2.0)

* You can determine this from the command line using ```julia --version```
* When the REPL launches you can see version information in the start-up splash.
* Julia has a command for displaying version information: ```versioninfo()```

## How to Exit Julia

Now that you can start the Julia REPL, you may wish to be able to close it.  This can be done using ```exit() ```
