#ifndef SKELETON_HEADER
#define SKELETON_HEADER
/* You might want to change the above name. */

#include "Absyn.H"


class Skeleton : public Visitor
{
public:
  void visitExp(Exp* p);
  void visitEAdd(EAdd* p);
  void visitESub(ESub* p);
  void visitEMul(EMul* p);
  void visitEDiv(EDiv* p);
  void visitEInt(EInt* p);

  void visit"Integer"("Integer" x);
  void visit"Char"("Char" x);
  void visit"Double"("Double" x);
  void visit"String"("String" x);
  void visit"Ident"("Ident" x);

};


#endif
