PDefs.   Program ::= [Def] ;

 

DFun.      Def    ::= Dec "(" [Arg] ")" "{" [Stm] "}" ;

DFunc.     Def    ::= Dec "(" [Arg] ")" ";" ;

DInline.   Def    ::= "inline" Dec "(" [Arg] ")" "{" [Stm] "}" ;

DInline2.  Def    ::= "inline" Dec "(" [Arg] ")" ";" ;

DTop.      Def    ::= TStm ";" ;

DUsing.    Def    ::= "using" QConst ";" ;

 

TopLevel.  TStm ::= "typedef" Dec ;

Toplevel2. TStm ::= Type [Id]  ;

Toplevel3. TStm ::= Dec "=" Exp ;

Toplevel4. TStm ::= "struct" Id "{" [Parameter] "}"  ;

TSInit.    TStm ::= "const" Dec "=" Exp ;

TSInit2.   TStm ::= "const" Type "&" Id "=" Exp ;

TSInit3.   TStm ::= Type "&" Id "=" Exp ;

 

terminator Def "" ;

 

ADecl.   Arg    ::= Dec ;

ADecl2.  Arg    ::= Type ;

ADecl3.  Arg    ::= Type "&" ;

ADecl4.  Arg    ::= Type "&" Id ;

ADecl5.  Arg    ::= Type "&" Id "=" Exp ;

ADecl5.  Arg    ::= Type Id "=" Exp ;

 

CADecl.   Arg    ::= "const" Dec ;

CADecl2.  Arg    ::= "const" Type ;

CADecl3.  Arg    ::= "const" Type "&" ;

CADecl4.  Arg    ::= "const" Type "&" Id ;

CADecl5.  Arg    ::= "const" Type "&" Id "=" Exp ;

CADecl6.  Arg    ::= "const" Dec "=" Exp ;

 

separator Arg  "," ;

 

Decl.  Dec ::= Type Id ;

 

Param. Parameter ::= Dec ";" ;

 

separator Parameter "" ;

 

SExp.        Stm ::= Exp ";" ;

STopLevel.   Stm ::= TStm ";" ;

SReturn.     Stm ::= "return" Exp ";" ;

SReturnVoid. Stm ::= "return" ";" ;

SWhile.      Stm ::= "while" "(" Exp ")" Stm ;

SDoWhile.    Stm ::= "do" Stm "while" "(" Exp ")" ";" ;

SFor.        Stm ::= "for" "(" Arg ";" Exp ";" Exp ")" Stm ;

SBlock.      Stm ::= "{" [Stm] "}" ;

SIf.         Stm ::= "if" "(" Exp ")" Stm ;

SIfElse.     Stm ::= "if" "(" Exp ")" Stm "else" Stm ;

 

terminator Stm "" ;

 

ETrue.   Exp15  ::= "true" ;

EFalse.  Exp15  ::= "false" ;

EInt.    Exp15  ::= Integer ;

EDouble. Exp15  ::= Double ;

EString. Exp15  ::= [String] ;

EChar.   Exp15  ::= Char   ;

EQConst. Exp15  ::= QConst ;

EApp.    Exp15  ::= Id "(" [Exp] ")" ;

EInd.    Exp15  ::= Exp15 "[" Exp "]" ;

 

EDRef.   Exp14  ::= "*" QConst ;

EPIncr.  Exp14  ::= Exp15 "++" ;

EPDecr.  Exp14  ::= Exp15 "--" ;

EProj.   Exp14  ::= Exp15 "." Exp14 ;

EProj2.  Exp14  ::= Exp15 "->" Exp14 ;

 

EIncr.   Exp13  ::= "++" Exp14 ;

EDecr.   Exp13  ::= "--" Exp14 ;

ENeg.    Exp13  ::= "!"  Exp14 ;

 

ETimes.  Exp12  ::= Exp12 "*"  Exp13 ;

EDiv.    Exp12  ::= Exp12 "/"  Exp13 ;

EMod.    Exp12  ::= Exp12 "%"  Exp13 ;

EPlus.   Exp11  ::= Exp11 "+"  Exp12 ;

EMinus.  Exp11  ::= Exp11 "-"  Exp12 ;

ELShift. Exp10  ::= Exp11 "<<" Exp10 ;

ERShift. Exp10  ::= Exp11 ">>" Exp10 ;

ELt.     Exp9   ::= Exp9  "<"  Exp10 ;

EGt.     Exp9   ::= Exp9  ">"  Exp10 ;

ELtEq.   Exp9   ::= Exp9  "<=" Exp10 ;

EGtEq.   Exp9   ::= Exp9  ">=" Exp10 ;

EEq.     Exp8   ::= Exp8  "==" Exp9 ;

ENEq.    Exp8   ::= Exp8  "!=" Exp9 ;

EAnd.    Exp4   ::= Exp4  "&&" Exp5 ;

EOr.     Exp3   ::= Exp3  "||" Exp4 ;

EAss.    Exp2   ::= Exp3 "=" Exp2 ;

EMe.     Exp2   ::= Exp3 "-=" Exp2 ;

EPe.     Exp2   ::= Exp3 "+=" Exp2 ;

ECond.   Exp2   ::= Exp2 "?"  Exp3 ":" Exp4 ;

EExcept. Exp1   ::= "throw" Exp ;

 

internal ETyped. Exp15 ::= "(" Exp ":" Type ")" ;

 

coercions Exp 15 ;

 

separator Exp "," ;

 

rules Type   ::= "bool" | "int" | "double" | "void" | QConst ;

 

separator nonempty Type "," ;

separator nonempty String "" ;

 

token Id (letter (letter | digit | '_')*) ;

 

separator nonempty Id "," ;

 

QualConst. QConst ::= [ConstName] ;

 

CName.  ConstName ::= Id ;

CName2. ConstName ::= TempInst ;

 

separator nonempty ConstName "::" ;

 

TInstant. TempInst ::= Id "<" [Type] ">" ;

 

comment "#" ;

comment "//" ;

comment "/*" "*/" ;
