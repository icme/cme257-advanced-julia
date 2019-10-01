# CME 257 Homework 1 (Survey)
Due Sunday 10/6 by 11:59pm

Email your scripts to jmblpati@stanford.edu with subject "cme 257 hw 1 submission"

The script should be in files named "lastname\_hw1\_p1.jl" "lastname\_hw1\_p2.jl" (replace "lastname" with your own last name).  The scripts should run from the command line:
```bash
julia lastname_hw1.jl
```


You may also submit your submission as a Jupyter notebook. If you choose do to so please submit one notebook for both problems.

If you find yourself struggling on either of these problems, please do not hesitate to contact me or come to office hours on Friday. 
---

## Problem 1
Write a Julia script that will print out your answers to the following survey.  You don't need to repeat the question, but please enumerate the answers.  It's OK if you don't have experience in everything asked about.

1. Your name
2. Program/year/other Stanford affiliation
3. Academic, Research, or Business interests
4. Why you want to take the course
5. Prior Julia experience
6. Programming experience - list languages with proficiency (1=novice, 2=intermediate, 3=experienced).
   1. If you don't have any experience with at least one of R, Python, or MATLAB, make a note
   2. If you don't have any experience with at least one of C, C++ or fortran, make a note
7. What operating system do you have?
8. How comfortable are you with the bash shell (0-3)
9. Have you ever used a version control system, such as git before?
10. What is one thing you'd really like to learn in this class?
11. Comments/concerns

## Problem 2

Implement the [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) to compute the set of all primes less than an integer N. Using this, compute the sum of all primes less than 10000. Keep in mind that 1 is not a prime. Do not use any dedicated prime-testing functions in Julia like ``isprime()``.
