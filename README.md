# compiler-assignments

Clone this repository into the repo that you use for the solutions of the assignments for the course on compiler construction.

## Assignment Typechecker 

**first deadline April 13, second deadline April 20**

The assignment is detailed [here](http://www.grammaticalframework.org/ipl-book/assignments/assignment2/assignment2.html).

Also read [Typechecker/Haskell/README.md](https://github.com/ChapmanCPSC/compiler-assignments/blob/master/Typechecker/Haskell/README.md) and the [list with Haskell tips](https://hackmd.io/nVQP-fp-TEWUbp9kecaLTQ).

### Introductory Remarks

To implement the typechecker I suggest that you use  Haskell. Java does not have algebraic data types or pattern matching.

To get you started Samuel Balco implemented the type checker in Haskell and Scala  and we can offer you template files in which you fill in the missing cases in the typechecker template file provided. 

- Haskell has the advantage that the code is the closest to the specification. One reason for this is that Haskell supports algebraic data types and pattern matching. A disadvantage of Haskell is that it requires some programming language concepts that you are likely to not have seen before, such as monads which are needed for error handling. But they are covered by what is in the template

- Scala has the advantage that it is close to Java but also incorporates features from functional programming similar to Haskell. In particular Scala has algebraic data types and pattern matching. We provide two implementations of the typechecker. Typechecker.scala was obtained by translating (by hand, not automatically) the Haskell typechecker into the object oriented language Scala. TypecheckerAlt.scala was obtained as a further modification that uses a method of error handling similar to the one of Java.

<!--
- Java has the advantage that it is the most familiar language to you. It also will give you the full experience as you are asked to produce the Java files you need using bnfc. If you have some previous experience with Java you should be able to see how to proceed from there by looking at Chapter 4 of the book and the Scala template file for the typechecker.
-->

### Details

- **Deadline April 13:**
    - Change directory to `Typechecker/Haskell` and [README](https://github.com/ChapmanCPSC/compiler-assignments/blob/master/Typechecker/Haskell/README.md). Run `stack build` and `stack test`.
    - The provided template `src/TypeChecker.hs` already passes two good programs in `test/good/`. Which programs are this? 
    - Find the functions `checkStm` and `inferTypeExp` in `TypeChecker.hs`. Which typechecking rules are already implemented? Hint:
      - Find and open the file `AbsCPP.hs`. Find the data types `Stm` and `Exp`. These are the data types of our abstract syntax tree. 
      - Each line in the definition of `Stm` or `Exp` corresponds to a line in the grammar [cpp.cf](https://github.com/alexhkurz/compiler-construction-2020/blob/master/Sources/Cpp/cpp.cf). Open the grammar in an editor and compare it line by line with `AbsCPP.hs`.
      - The typechecker works by induction (or recursion) over the data types `Stm` and `Exp`. For each line in the data type there must be a corresponding case  in `checkStm` or `inferTypeExp`.
    - Find and open the program `easy_add.cc`. 
      - What is the abstract syntax tree of `easy_add.cc`? Hint: 
        - Use [bnfc](https://github.com/alexhkurz/compiler-construction-2020/blob/master/bnfc-tutorial-short.md) to create a parser from the grammar [cpp.cf](https://github.com/alexhkurz/compiler-construction-2020/blob/master/Sources/Cpp/cpp.cf).
         - Then use the parser to create the linearized abstract syntax tree of `easy_add.cc`.
      - Which rule needs to be implemented to typecheck the program `easy_add.cc`? Hint: `PDefs`, `Dfun` and number of other cases are already implemented in `TypeChecker.hs`.
      - Add the corresponding code to the `inferTypeExp` function of `TypeChecker.hs`. Hint: This may look complicated at first sight, but notice that the typechecking for multiplication is already implemented in the template. 
      - After adding the typechecking rule for addition, you should get upon running `stack build` and `stack test`

            Good programs: passed 3 of 76 tests
            Bad programs:  passed 74 of 74 tests

    - Which two rules need to be implemented to typecheck the program `ass_easy.cc`?
      - Hint: If you run `stack exec CPPTypeChecker-exe ass_easy.cc` you will get a hint of what the missing rule is. 
      - Hint: To implement the rule, note that you can return a value without writing `return`. In fact, `return` is only needed if you want to typecast a value of type `Env` into a value of type `Err Env`. For now, you can more or less ignore the difference between `Env` and `Err Env`: While `Env` is the type of environments, a value of type `Err Env` is either an environment or an error message. 
    - After building and testing you should now get:
      
            Good programs: passed 5 of 76 tests
            Bad programs:  passed 73 of 74 tests

    - Remark: At the beginning you should focus on increasing the number of passed good programs. And it is probably easier to do first the expressions and then the statements.

- **Deadline April 20:** Implement the remaining cases until you pass all test programs. As shown above it may be good to pick a short and easy good test program and think about what is needed to make the typechecker pass it.


## Assignment Interpreter  

**first deadline April 22, second deadline April 29**

The assignment is detailed [here](http://www.grammaticalframework.org/ipl-book/assignments/assignment3/assignment3.html).

To implement the interpreter I suggest that you use Haskell. Don't forget the [Haskell Tips](https://github.com/ChapmanCPSC/compiler-assignments/blob/master/Typechecker/Haskell/README.md) from the typechecker assignment. 

Again we provided template files for Haskell and Scala. 

You can implement the interpreter without having a typechecker. (Just don't be surprised if curious things then happen if you run the interpreter on "bad" programs.)

In any case you need to test your interpreter on all the (good) test files, see [here](https://github.com/ChapmanCPSC/compiler-assignments/tree/master/Interpreter/Haskell/test/good) or [here](https://github.com/ChapmanCPSC/compiler-assignments/tree/master/Interpreter/Scala/src/test/good).

**Deadline April 22**

- Change directory to  `Interpreter/Haskell` and run `stack build` and then `stack test`. Among other output, you should see

      Good programs: passed 10 of 75 tests

  To see which are the good programs run `stack test | grep OK`. Look at these programs in `test/good/` to get an idea of what the interpreter can already do and study the functions `evalStm` and `evalExp` in `src/Interpreter.hs`. Try to understand the grand outlines of how these two functions interpret the 10 passing programs.

- Look at the program `easy_add.cc`. Draw the abstract syntax tree in your mind or using bnfc. Which missing case of the `evalExp` do you need to implement in order for the interpreter to work on this program?

- Extend `Interpreter.hs` so that it interpretes correctly `easy.add`. Hint: Study the case of `ETimes` that is already implemented.

- Hand in on github your solution by the end of April 22.

**Deadline April 29**

Implement the remaining cases so that the interpreter passes all test programs.

## Assignment Compiler

**starts April 30, first deadline May 1, second deadline May 10**

For the first deadline follow the intstallation instructions and do the exercise of [Lecture 12.1](https://github.com/alexhkurz/compiler-construction-2020/blob/master/lecture-12.1.md).

For the second deadline complete the template file `test/Compiler.hs`. To get started, I suggest the following.

- Change directory to `Compiler` and run `./setup.sh` and `stack test`. You should see that no tests are passed.

*Remark:* (We fixed the problem described in this remark, but I leave it in as docker may still be useful for similar incompatibility problems that may arise in the future.) Our first version was compatible with `node` version 10 but not with `node` version 14. Jonathan Burns located and fixed this problem by  providing a dockerfile that you can run by `docker build . -t compiler`.

- The simplest test program is `test/good/return_42.cc`, displayed below.

      int main() {
        return 42;
      }

  Our first task will be to extend `Compiler.hs` so that it passes `return_42.cc`. In particular, we have to complete the definition of

      compileStm :: MonadState Env m => Stm -> m [SExp]

  and of 

      compileExp :: MonadState Env m => Nesting -> Exp -> m [SExp]

- Here, `SExp` does not refer to the eponymous rule in the grammar, but is short for S-expression. Let us have a look at the definition of `SExp` in the compiler:

      data SExp = Atom String | List [SExp] deriving Eq

  In words, an `SExp` is either a string labelled by `Atom` or a list of `SExp`s. This is the datatype that the compiler uses for Webassembly output. To see an example, find  
  
      test = s_module [
              s_import "readInt" [] s_i32,
              s_import "readDouble" [] s_f64,
              s_import "printInt" [s_i32] s_void,
              s_import "printDouble" [s_f64] s_void,
              s_func "main" [] s_i32 [
                  s_local "i" s_f64,
                  s_call "readDouble",
                  s_local_set "i",
                  s_local_get "i",
                  s_call "printDouble",
                  s_i32_const 0
              ],
              s_export "main"
          ]
  
  in the compiler and run 
  
      stack ghci
      putStrLn $ pprint test
      
  The first line brings up the Haskell REPL and the second then generates the following Webassembly program in Wat-format.

      (module
       (import "env" "readInt" (func $readInt (result i32)))
       (import "env" "readDouble" (func $readDouble (result f64)))
       (import "env" "printInt" (func $printInt (param i32)))
       (import "env" "printDouble" (func $printDouble (param f64)))
       (func
        $main
        (result i32)
        (local $i f64)
        (call $readDouble)
        (local.set $i)
        (local.get $i)
        (call $printDouble)
        (i32.const 0)
       )
       (export "main" (func $main))
      )

  If you want to see the details of how the translation from `SExp` to Webassembly (Wat, to be precise) works, find the definition of `pprint` in the compiler.

- To summarise this excursion into `SExp` think of it as an intermediate representation that provides a suitable output format for the compiler and at the same time is very close already to Wat programs.

- Let us return to the task of generating Wat-code from `return_42.cc`. 

- As we have done above for the typechecker, we use the bnfc generated parser to obtain the abstract syntax tree of `return_42.cc`. This tells us that we need to implement `EInt` in `compileExp` and `SReturn` in `compileStm`.

- Let us start with `EInt`. 
  - We need to consider that at the top level expressions do not return a result (checkout the rule `SExp` of the grammar). 
  - To deal with this, the compiler makes a distinction between `TopLevel` and `Nested` (checkout the definition of `data Nesting` in `Compiler.hs`). 
  - Finally, we need to generate code. For this we use the `s_`-functions defined at the beginning of the compiler. Each `s_`-function returns an `SExp`. Reading throug the definitions from `s_i32` to `s_f64_ne`, you will recognize the Webassembly code we have written by hand in the lectures. For example, we find there

        s_i32_const i = List [Atom "i32.const", Atom (show i)]

    which will output the Webassembly fragment `i32.const i` (with `i` replaced by its value). 
    

  - Finally, we can implement the case `SExp`
  
        compileExp n (EInt i) = return $ if n == Nested then [s_i32_const i] else []

- We continue with `SReturn`, that is we need to complete the definition of 

      compileStm (SReturn e) = do

  In this case, `e` is a nested expression. So we continue the recursion with

      compileStm (SReturn e) = do
        s_e <- compileExp Nested e

  and then return

      return $ 
        s_e ++ 
        [s_return]

  To see that this is correct recall that `++` is concatenation of lists and run (in the Haskell REPL, see above)

      putStrLn $ pprint $ List [s_i32_const 1, s_return]
  
  which indeed gives the output you would expect from your knowledge of Webassembly (see Lectures 12.1 and 12.2). Btw, if you want the output to be not just a Wat-fragment but a valid program you can write instead

      putStrLn $ pprint $ s_module [ s_func "main" [] s_i32 [ s_i32_const 1, s_return ] ]

- Use `Ctrl-d` to exit the Haskell REPL.

- Putting things together, we can now run `stack test | grep Success` on the modified `Compiler.hs` and should obtain

      Successfully compiled to Wasm: ass_in_arith.cc
      Successfully compiled to Wasm: ass_in_cmp.cc
      Successfully compiled to Wasm: ass_many.cc
      Successfully compiled to Wasm: ass_var_to_var.cc
      Successfully run: ass_var_to_var.cc
      Successfully compiled to Wasm: branch_value_leaks.cc
      Successfully run: branch_value_leaks.cc
      Successfully compiled to Wasm: cmp.cc
      Successfully compiled to Wasm: cmp_bool.cc
      Successfully compiled to Wasm: core005.cc
      Successfully compiled to Wasm: core006.cc
      Successfully compiled to Wasm: core007.cc
      Successfully compiled to Wasm: core009.cc
      Successfully compiled to Wasm: core012.cc
      Successfully compiled to Wasm: core019.cc
      Successfully compiled to Wasm: core102.cc
      Successfully run: core102.cc
      Successfully compiled to Wasm: core110.cc
      Successfully compiled to Wasm: core111.cc
      Successfully compiled to Wasm: decr_in_if.cc
      Successfully compiled to Wasm: div.cc
      Successfully compiled to Wasm: do_nothing.cc
      Successfully run: do_nothing.cc
      Successfully compiled to Wasm: double__cmp.cc
      Successfully compiled to Wasm: double__core012.cc
      Successfully compiled to Wasm: double__inc_dec.cc
      Successfully compiled to Wasm: fibonacci.cc
      Successfully compiled to Wasm: good01.cc
      Successfully compiled to Wasm: good03.cc
      Successfully compiled to Wasm: good05.cc
      Successfully compiled to Wasm: good07.cc
      Successfully compiled to Wasm: good09.cc
      Successfully compiled to Wasm: good11.cc
      Successfully compiled to Wasm: good13.cc
      Successfully compiled to Wasm: good15.cc
      Successfully compiled to Wasm: good17.cc
      Successfully compiled to Wasm: if_state_propagation.cc
      Successfully compiled to Wasm: ineq_inclusive.cc
      Successfully compiled to Wasm: redeclare_after_if.cc
      Successfully compiled to Wasm: redeclare_after_while.cc
      Successfully compiled to Wasm: redeclare_in_if.cc
      Successfully compiled to Wasm: redeclare_in_while.cc
      Successfully compiled to Wasm: return_42.cc
      Successfully run: return_42.cc
      Successfully compiled to Wasm: return_in_if_left.cc
      Successfully compiled to Wasm: return_in_if_right.cc
      Successfully compiled to Wasm: return_in_while.cc
      Successfully compiled to Wasm: scopes_different_type_in_branches.cc
      Successfully run: scopes_different_type_in_branches.cc
      Successfully compiled to Wasm: scopes_if_leakage.cc
      Successfully run: scopes_if_leakage.cc
      Successfully compiled to Wasm: scopes_reuse_name.cc
      Successfully compiled to Wasm: scopes_while_leakage.cc
      Successfully run: scopes_while_leakage.cc
      Successfully compiled to Wasm: void_expr_as_stmt.cc
      Successfully compiled to Wasm: void_return_empty.cc
      Successfully run: void_return_empty.cc

  This was hard work, but we see that we made some progress. If you want to see the work that remains run `stack test | grep Error`.

  Some further remarks:

  - If you just want to compile `return_42.cc` to Wat, run

        stack run test/good/return_42.cc

    which will place `a.wat` in `Compiler`.
  - The reason that many programs compile "successfully" to Wasm is that `compileStm` and `compileExp` have catch-all clauses that make the compiler ignore all constructs that are not yet implemented. Look at `redeclare_in_in.wat` to see an example of what that means. So don't take this as a sign of success without further investigation.

  - The programs that also run "successfully" have no specified output, so the fact that they pass the test does not mean automatically that they are compiled correctly. 

I would suggest you continue with arithmetic and in/de-crements as well as loop and conditional as discussed in the lectures.
      


