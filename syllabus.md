# CME 257 - Advanced Topics in Scientific Computing with Julia

* Location: [STLC105](https://campus-map.stanford.edu/?srch=STLC105)
* Time: Tuesdays 3:00 PM -- 4:20 PM
* This 1-unit course meets once a week for the first 8 weeks of the quarter

---

* Instructor: Brad Nelson
* Email: [bjnelson@stanford](mailto:bjnelson@stanford.edu)
* Office Hours: TBD

---



### Overview

This course is intended to introduce students who are already somewhat familiar with scientific computing to what Julia has to offer.  It is not intended to be a first course in programming (there are several other short courses that are more suited for this purpose).  This is not to say that Julia itself is a difficult language to learn - it is pretty easy to get started with a search online, but that the course will cover material that likely won't be useful if you don't have some context to place it in.  

Briefly, this course covers topics that you may find useful when using Julia for a research project.  In addition to an introduction to the Julia language, we'll cover version control using git, interfacing with existing code (including in different languages), performance, and parallelism.  Examples will focus on the workhorses of scientific computing - linear algebra and optimization, but we'll also try to showcase some applications.

A tentative schedule follows (topics may bleed into more than one day)

1. Programming in Julia
  * Basics / getting started
  * Object Oriented Features, type system
2. The Julia Ecosystem
  * Packages (common scientific computing packages, and how to use them) - graphics, math packages, graph theory, optimization, etc.
  * Intro to git
3. Practical Julia
  * How to write your own package/module, more GitHub
  * Interfacing with C/Fortran shared object libraries, Python, other languages
4. Julia in the Wild
  * Debugging, performance, etc.
  * Special topics - parallelism, linear algebra implementations, blas calls, etc., the future of Julia

Julia is a relatively new language, and is still being rapidly developed, we're going to work with the most recent version we can [on GitHub](https://github.com/JuliaLang/julia).  This will allow us to see the most up-to-date functionality, and maybe you'll even find something you can contribute to.

I want to cover material that is interesting and useful to you.  If there is something in particular that you would like to see, let me know!

### Goals

* Learn the basics of Julia and git, and learn where to find more information
* Explore some of the scientific computing capabilities of Julia
* Learn how to create a Julia package for your own projects

### Resources

* See [resources.md](resources.md)
* You are also welcome to use Google to find tutorials or for troubleshooting solutions online.  Let me know if you find a good resource!

### Prerequisites
Prerequisites are rather soft - if you're thinking of using Julia for a project, you probably have sufficient background.  The only real prerequisite is some experience with programming (this course isn't an introduction to programming).

What you may find useful to have seen before (not necessarily in any great depth)
* Experience with one or more scientific computing languages (e.g. Python, Matlab, R, ...)
* Some idea of what matrices and vectors are, and some idea of why one may wish to find a minimum or maximum of a function
* Some familiarity with the Unix shell
* Data structures (e.g. at the level of CS106B)

No prior experience with Julia or git is required.


## Structure of the course
### Class
I hope to make the class as hands-on and interactive as possible.  It is fairly easy to learn the basics of Julia on your own, so instead of lectures on something you can find better explained on Google, the class will be held in a workshop-like style.  Please bring a laptop to class.

### Homework
Since the best way to learn a new language is through practice, there will be some homework.
* There will be 3 or 4 assignments, which should take about an hour each.  
* On weeks without a full homework, there will be a short exercise (less than 15 minutes to complete)

Homework will generally be assigned after class on Tuesdays, and will be due Sunday at noon.

This is a 1-unit course, and the goal is not to overwhelm you. If you are stuck on an assignment, please ask for help instead of spending large amounts of time searching for an answer.

### Grading
This course is offered only on a credit/no-credit basis.  You don't need to worry about perfect assignments, just make sure code runs as expected and is intelligible.  Assignments (50%) will be marked as complete or incomplete, and I will also try to give useful feedback.  I expect you to try all the homework (unless otherwise noted), and if you're stuck a partial answer or short note explaining what you've tried will be fine.  You can have one 24-hour extension, otherwise late assignments will not be marked complete or receive feedback.

Participation (50%) will also be important given the style of the course.  I expect you to come to class (there are only 8), but understand that you may have unavoidable conflicts come up.  If you need to miss a class please send me an email.

## Stanford Policies

### Honor Code
This course is intended to be collaborative.  You can (and should) work with other students in class and on homework.  You should turn in your own solutions (don't copy others). If you worked closely with someone or found an answer on the web, please acknowledge the source of your solution.


### Students with Documented Disabilities
Students who may need an academic accommodation based on the impact of a disability must initiate the request with the Office of Accessible Education (OAE).  Professional staff will evaluate the request with required documentation, recommend reasonable accommodations, and prepare an Accommodation Letter for faculty dated in the current quarter in which the request is being made. Students should contact the OAE as soon as possible since timely notice is needed to coordinate accommodations.  The OAE is located at 563 Salvatierra Walk (phone: 723-1066, URL: http://studentaffairs.stanford.edu/oae).
