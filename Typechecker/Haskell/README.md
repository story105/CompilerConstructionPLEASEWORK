# CPPTypeChecker

To compile run `stack build` and to test run `stack test`

The files produced by bnfc are in src:

	AbsCpp.hs
	ErrM.hs
	LexCpp.hs
	ParCpp.hs
	PrintCpp.hs

The template for the typechecker is in `TypeChecker.hs`. This where you find the code that you need to complete.

To know which cases you need to add, look at the grammar as well as at the algebraic data type for abstract syntax trees define din `AbsCpp.hs`.

The error monad that is used to modify the type `Type` of CPP-types is defined in `ErrM.hs`.



