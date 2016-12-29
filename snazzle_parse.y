%{
  #include <stdio.h>
  #include "snazzle_lex.h"
  
  void yyerror(const char *s);
%}

// Bison fundamentally works by asking flex to get the next token, which it
// returns as an object of type "yystype".  But tokens could be of any
// arbitrary data type!  So we deal with that in Bison by defining a C union
// holding each of the types of tokens that Flex could return, and have Bison
// use that union instead of "int" for the definition of "yystype":
%union {
  int ival;
  float fval;
  char *sval;
}

// define the "terminal symbol" token types I'm going to use (in CAPS
// by convention), and associate each with a field of the union:
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

%define api.prefix {snazzle_}

%%
 // this is the actual grammar that bison will parse, but for right now it's just
 // something silly to echo to the screen what bison gets from flex.  We'll
 // make a real one shortly:
snazzle:
INT snazzle      { printf("bison found an int: %d\n", $1); }
| FLOAT snazzle  { printf("bison found a float: %f\n", $1); }
| STRING snazzle { printf("bison found a string: %s\n",  $1); }
| INT            { printf("bison found an int: %d\n", $1); }
| FLOAT          { printf("bison found a float: %f\n", $1); }
| STRING         { printf("bison found a string: %s\n", $1); }
;
%%

void yyerror(const char *s) {
  printf("EEK, parse error!  Message: %s\n", s);
  // might as well halt now:
  exit(-1);
}
