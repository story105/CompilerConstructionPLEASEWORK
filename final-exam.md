# Final Exam

## Rules

- Deadline is Thursday, May 21, 11:59pm.
  - Submission via email, preferably by [clicking on this link](mailto:akurz@chapman.edu?subject=Compiler-Construction-final-exam).
   - I estimated that the answer to each of the 4 questions can be drafted in one hour. When you are planning your time, multiply this by 2 in order to not be under pressure and inlcude time for carefully writing out the final version. 

- There is a total of **30 points**.
- **No communication** with other people. You have to work alone. 
- You can use all my notes, the book, run bnfc, run a C++ compiler.
- I only accept **hand-written** solutions. Programs and their outputs do not need to be written by hand. Attach the program as a `.cc`file to your email.


## Layout and Write-up (6 points)

Of the overall 30 points, 6 points will be awarded for thoughtful layout and nice write-up. I recommend to first draft your answers and only then write them up in final form. Make sure that the pictures you take are not too dark and show enough contrast.

## Question 1: Write a Program (6 points)

1. (4 points) Write a C++ program conforming to the grammar [cpp.cf](https://github.com/alexhkurz/compiler-construction-2020/blob/master/Sources/Cpp/cpp.cf), containing at least the following features:
   - a `main` function
   - a variable declaration
   - a call to printInt (see [here](https://github.com/alexhkurz/compiler-construction-2020/blob/master/lecture-12.1.md#run-the-c-program) for how to run a C++ program with `printInt()`)
   - 2 different arithmetic operations plus one pre-(in or de)-crement and one post-(in or de)-crement
   - a new block with at least one variable declaration
   - a loop and/or a conditional

2. (1 point) Run the bnfc-generated parser on your program and write out the linearized abstract syntax tree.

3. (1 point) Test your program with a C++ compiler to make sure that it is correct. What values does it print?

## Question 2: Parsing (6 points)

1. (4 points) Show the steps taken by a shift/reduce parser on your program above. If your program is very long choose an interesting fragment. Make sure you label the reduction steps with the corresponding names of the grammar.

2. (1 point) Write down the concrete syntax tree of the program (in 2-dimensional, not in linearised form).

3. (1 point) Write down the abstract syntax tree of the program (in 2-dimensional, not in linearised form).

## Question 3: Type Checking (6 points)

1. (3 points) Show, in the form of a proof tree, the steps taken by a type checker. If your program is very long choose an interesting fragment. 

2. (2 points) Write down the type checking rules that justify the steps taken in your proof tree. 

3. (1 point) Name the rules and label the steps in the proof tree accordingly.

All of the rules you need you implemented in your typechecker of Assignment 3. Write them down in the rule format we learned in Chapter 4 of the book [Implementing Programming Languages](http://www.cse.chalmers.se/edu/year/2012/course/DAT150/lectures/plt-book.pdf). 

## Question 4: Interpretation (6 points)

1. (3 points) Show, in the form of a proof tree, the steps taken by an interpreter evaluating your program. If your program is very long choose an interesting fragment. 

2. (2 points) Write down the rules that justify the steps taken in your proof tree. 

3. (1 point) Name the rules and label the steps in the proof tree accordingly.

All of the rules you need you implemented in your interpreter of Assignment 4. Write them down in the rule format we learned in Chapter 5 of the book. 

