# Testing the CPP Interpreter in Haskell


To compile run `stack build` and to run all tests do 

    stack test, run
    
To test a particular `program.cc` do

    stack exec CPPInterpreter-exe ./test/good/program.cc
    
This is particularly helpful if the interpreter loops infinitely on `program.cc`. In this case, 

- make  `program.cc` so small that the error does not occur anymore
- make  `program.cc` bigger so that the error comes back
- iterate the above until you found the smallest version of `program.cc` that exhibits the bug
- insert `printInt` statements as needed to track the execution of the program
- guess what could cause the problem and change `Interpreter.hs`
- iterate all of the above

If all of this does not help, save this particular program for the end and try to get the interpreter first working on all of the other programs. If you are lucky, this will already solve the problem of `program.cc` as well.

