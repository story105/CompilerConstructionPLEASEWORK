#ifndef PARSER_HEADER_FILE
#define PARSER_HEADER_FILE

#include<vector>
#include<string>


class Exp;

typedef union
{
  int int_;
  char char_;
  double double_;
  char* string_;
  Exp* exp_;
} YYSTYPE;

Exp* pExp(FILE *inp);
Exp* pExp(const char *str);



#define _ERROR_ 258
#define _SYMB_0 259
#define _SYMB_1 260
#define _SYMB_2 261
#define _SYMB_3 262
#define _SYMB_4 263
#define _SYMB_5 264
#define _INTEGER_ 265

extern YYSTYPE yylval;

#endif
