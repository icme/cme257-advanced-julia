# Becoming Your Own System Administrator

For some of you, this class may be the first time using a personal computer for coding/development outside a controlled environment such as an IDE. Then you login to a remote cluster, often someone else (a system administrator) maintains user accounts and software on that machine, and you can request that software be added. When you use your own machine for software development, you have to become your own system administrator.  This means you need to learn a few things about how your computer works under the hood, but also gives you a lot of control over your machine.

This document contains a few hints to get you started as your own system administrator.  Again, this is assuming you have a *nix system.  Of course, there is a lot out there, but you can go a long way just knowing some basics.

## Mac Users

Mac users should begin by installing [Xcode](https://developer.apple.com/xcode/) which is Apple's development toolkit.  
There's a lot in there, but at a high level it transforms your Mac from a consumer product into a professional development machine.

If you are running Linux, congratulations - you already have a professional development machine.

## Pacakge Managers

Pacakge managers are your friend.  They make installing, upgrading, and maintaining software super easy. Most Linux distributions come with a package manager (e.g. apt-get or dnf).

Mac users will want to install a package manager.  One popular option is [homebrew](https://brew.sh/), but there are others out there.

If you aren't sure what your package manager is, search "(your operating system) package manager" on the internet.  The first few results will get you started.

Many programming languages (and other software bundles) have their own package managers.  
For example, python has pip (or conda), node has npm, atom as apm, and Julia has Pkg.

We've seen how Julia's package manager makes installing Julia packages very easy.  The same is true for system package managers.  
Let's say that I need to have a fortran complier on my system (my package manager is dnf on Fedora linux).  Then I can just open up a terminal and type
```bash
dnf install gfortran
```
and after an automated intstallation process completes, I can now use gfortran on my system
```bash
gfortran --version
```

You'll be surprised how much you can obtain via a package manager.  Most popular software tools/libraries for scientific computing and data science can be obtained this way.

## User Privileges

*nix systems try to keep you (and others) from removing critical files and programs from your computer, or installing software that has abilities to read/write in sensitive areas of the file system.  This is useful, because it makes it harder for you to accidentaly break your computer, or for a hacker to execute malicious code on your system.  However, sometimes you'll need to acutually need to modify these files or add programs to your system that require elevated privileges.
Often you will find this out when you get an error that says so.

This is where the ```sudo``` command (super-user-do) comes into play.  To edit certain files or install programs in certain locations you need to have elevated privileges on your system.  To invoke these privileges you can begin a command with  ```sudo``` e.g. ```sudo gedit file.txt``` then type your password at the prompt.

Note that when you elevate your privileges, you can potentially do some very bad things, like delete all files from your computer, or make it so your operating system no longer works.
This means that you shouldn't use it without thinking about it, and don't just blindly copy commands from the internet without understanding what they will do.  
You can also do some very powerful good things, like partition your hard drive, install software for all users, and modify operating system settings.

You can also navigate the bash shell as a super user using the ```su``` command.

If you ever run into an error with file permissions, ```chmod``` is a command that may help you out.
  


