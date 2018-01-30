# CME 257 Class 4 - using Git

(Some of this material was originally borrowed from the 2015 version of CME211, taught by Nick Henderson)

If you don't have a mac or linux computer, it may be easiest to ssh into farmshare to follow along.

## Getting started

We've already used git to download the latest version of Julia on our computers.  Here's a recap of how you do this

```bash
git clone git@github.com:JuliaLang/julia.git
```

and maybe

```bash
cd julia
git checkout v0.6.2
```

We've also seen Julia's package manager is doing something under the hood, when we do something like
```julia
Pkg.clone("git@github.com:JuliaSparse/Metis.jl.git")
```

Today we'll talk a bit about what's going on here - version control using git.

## What is git?

First, let's note that GitHub is not git (and git is not GitHub).  We use GitHub in this course because that is where Julia and its packages are stored.  GitHub is a host for remote git repositories, and there are other such hosts (for example bitbucket.org).  You can also set up your own remote repository on a private server, or even use git without a remote repository.  If you're a student, you can request an academic account on GitHub (use your Stanford email) to let you have private repositories for free.  This is nice for research, or other projects you're not quite ready to share with the world.

What is git?  It is a version control system.  This enables:
* periodic saving of work (called *committing*)
* returning to old versions when a problem is introduced
* creation of experimental code *branches* with out disturbing the main or working code
* *merging* the concurrent work of independent developers
* *remote* backup and storage of work
* tracking a *log* of project history

Git is not the only tool used for version control, although it is one of the most popular.  Others include
* CVS (Concurrent Versioning System)
* SVN (Subversion)
* HG (Mercurial)

If you haven't used version control before, this class will introduce you to the basics of git, and why it is a good idea to use it.  This isn't intended to be a comprehensive overview of git let alone version control, but will hopefully give you a bit of familiarity and experience with 95% of the operations you will use in git.

## Resources
* Git homepage: http://git-scm.com/
* Git documentation: http://git-scm.com/doc
* Git Book: http://git-scm.com/book/en/v2

## Setup

The first time you use git on a machine you should give it your name and email, so it knows who is commiting changes.

```bash
git config --global user.name "Your name"
git config --global user.email your@email.com
```

This creates a file at ~/.gitconfig, which you can view/edit.

You can see what your settings are at any time with

```bash
git config --list
```

When using GitHub, you will also need to upload ssh keys in order to push changes to the remote repository.  

```bash
ssh-keygen -t rsa -b 4096 -C "youremail@email.com"
```

You can view the contents of your public key
```bash
cat ~/.ssh/id_rsa.pub
```
and copy and paste it to your [GitHub settings](https://github.com/settings/ssh).

GitHub has more detailed instructions [here](https://help.github.com/articles/generating-ssh-keys/)

## Basics

initializing a repository:
```bash
cd my_directory
git init .
```

View the current status of your repository:
```bash
git status
```

adding a file to commit:
```bash
git add file.txt
```

remove a file from the repository:
```bash
git rm badfile.txt
```

commit changes:
```bash
git commit -m "brief description"
```
if you don't pass a message, git will open up a text editor for you to comment in (you can specify a default editor using git config).  Writing some sort of informative message is important, since it helps you roll back changes in the future if you accidentally break something.

## Exercise 1
On farmshare (or on your own computer) create a new folder, and initialize it as a git repository.  I'll use cme257 as my folder name if you want to agree with what you see here.
* setup git on your system if you have not already
* touch a file 'README.md' in your folder,
* Make the first line of the file
```
# Toy git repository
description coming soon
```
* add the file and commit it to the repository.

## DAGs and git

One useful way to think about what git is doing is to think of its operations creating vertices and edges on a [directed acyclic graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph) (DAG) ([here](http://eagain.net/articles/git-for-computer-scientists/) is a reference for the graph-inclined folks).

* a commit creates a vertex
* you add an edge between two sequential commits

So far the DAG we've made is not very interesting.  Here are some

* git branch - create a new branch.  This allows you to add more than one child to a vertex on your DAG.  There is always one branch by default - master.

```bash
git branch # print out available branches
git branch branch1 # creates a new branch 'branch1'
git checkout branch1 # create content on branch1
git checkout master # create content on the master branch
git checkout -b branch2 # create a new branch 'branch2', and check it out
```

* git merge - merge two branches into one.  Creates edges from the two branch nodes onto one vertex.  This new node has two parents in your DAG.

```bash
git checkout master # checkout the branch you want to merge to
git merge branch1 # merge the added content.
```

Sometimes a merge is a clean process.  Other times, the same file on different branches may be in a different state.  Git provides a mergetool to help resolve these differences.

```bash
git mergetool
```

After you are done with a branch, you can delete it.

```bash
git branch -d branch1 # delete branch 'branch1'
```

## Exercise 2
use git status to keep track of what is going on.
* create a branch in your repository and edit README.md to read
```
# Toy git repository
this repo is just for show
```
* commit your changes
* change to the master branch
* edit your README to say
```
# Toy git repository
description coming soon
installation note
```
* commit your changes.
* merge your branch with master.  Keep the third line of README in master, but use the second line in README from your branch
* can you draw a DAG that describes what just happened?

## More git commands

* git log

Git log will display a history of commits and messages

```bash
git log
git log --stat # show which files were changed and # lines changed
```

* git reset  

git reset can perform the opposite of git add if you don't wish to commit changes to a particular file
```bash
git add file.txt # stage file for commit
git reset file.txt # remove file from staging
```
Sometimes you may want to completely discard your changes because you went down the wrong path.
```bash
git reset --hard <commit> # return tracked files to the state they were in at <commit>
git reset --hard # return to state of last commit
```

* git rebase

Sometimes, you may wish to change the start of a branch from one place to another.  This is useful if changes on a branch do not rely on changes that occurred after the branch was formed.

```bash
git rebase master branch # rebases branch to be on master
```

* .gitignore

This isn't actually a command, but you can create a file that will tell git to ignore certain files or types of files.

```
# .gitignore
secrets.txt # don't share secrets
*~ # emacs temp files - * is a wildcard
```


## Exercise 3

* Edit your README, git add, then git reset it.  Then hard reset your changes.
* Create a branch, commit a change.  Switch to master and make a different change.  Rebase your branch to the most recent commit on master.


## Creating a GitHub repository

* git clone - create a copy of a remote repository on your machine

```bash
git clone <url>
```

* git pull - this will update your local repository from the remote repository.  You will do this often if you're collaborating on a project, or are using a project that is being actively worked on.

```bash
git pull origin master # pull contents of origin to update master
```

* git push - this will update the remote repository with changes that you've made locally

```bash
git push origin master
```

#### Demo

1. start on GitHub
2. clone to your machine

#### Syncing with the remote repo

Push local changes to remote:

1. add file on `corn.stanford.edu`
2. commit locally
3. push to GitHub

Pull down remote changes

1. add a new file on GitHub
2. pull changes to `corn.stanford.edu`


## Contributing to projects on GitHub (or elsewhere)

There are several ways to contribute to a project on GitHub
* you are an owner of the project and can commit directly to the main repository
* you fork someone else's repository, change your version, and submit a pull request

Not all contributions involve writing code or documentation.  If you use someone else's code and find a bug, even if you don't know how to fix it you can file an issue which may let the developer track down your problem.  You can also file issues that request new features if you think they should be implemented. This takes a little effort, but if someone fixes your problem, you're getting a great deal.

#### Workflow

* git remote - This will give you information on remote repositories.

```bash
git remote -v # list remote repository for your local repository
```

* create a fork - this can be done from GitHub.  Clone it on your machine.
* Now you want to tell your local repo where the origin of your fork was.  This will be referred to as 'upstream'

```bash
git remote add upstream <original repo url>
git remote -v # see what changed
```

* updating your fork

If you've set upstream, and you want to update your fork from the original project, you can do the following:

```bash
git fetch upstream # retrieves state of upstream repo
git checkout master
git merge upstream/master # merge the upstream master into your master
git push origin master # push changes to your remote fork.
```

* create a pull request

This is fairly easy to do from GitHub.
1. Update your fork to be as close as possible to the upstream master
2. Commit your changes to your fork
3. Push your changes to origin on GitHub.
4. In GitHub, from your fork you can create a pull request.

#### Continuous integration

Online repository hosting is also useful for continuous integration testing.  One popular system is [Travis CI](https://travis-ci.org/) (you can get a free account with your GitHub student account).  CI systems will test your repository regularly by installing it on a virtual machine and running tests.  This is a good way to verify that it is easy for others to use code that you have written and reproduce your results. Note that many Julia packages and Julia itself use Travis CI, as well as [AppVeyor](https://ci.appveyor.com) (CI for Windows).  You can also use code coverage tools (such as [Coveralls](https://coveralls.io)) to tell you how much of your code base is covered by your test suite.

## Exercise 4
You'll need to do this for HW3.
* fork a copy of the course git repository.
* add the main repository as upstream.
