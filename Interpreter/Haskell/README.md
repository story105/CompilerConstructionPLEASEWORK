# Testing the CPP Interpreter in Haskell


To compile run `stack build` and to run all tests do 

    stack test, run
    
To test a particular program do

    stack exec CPPInterpreter-exe ./test/good/name_of_program.cc
    
This is particularly helpful if the interpreter loops infinitely on `name_of_program.cc`. In this case, 

- make  `name_of_program.cc` so small that the error does not occur anymore
- make  `name_of_program.cc` bigger so that the error comes back
- iterate the above until you found the smallest version of `name_of_program.cc` that exhibits the bug
- insert `printInt` statements as needed to track the execution of the program
- guess what could cause the problem and change `Interpreter.hs`
- iterate all of the above

If all of this does not help, save this particular program for the end and try to get the interpreter first working on all of the other programs. If you are lucky, this will already solve the problem of `name_of_program.cc` as well.

