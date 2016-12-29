%{
#include <stdio.h>
#include "snazzle_parse.h"
%}

%option prefix="snazzle_"
%option noyywrap

%%
[ \t\n]         ;
[0-9]+\.[0-9]+  { snazzle_lval.fval = atof(yytext); return FLOAT; }
[0-9]+          { snazzle_lval.ival = atoi(yytext); return INT; }
[a-zA-Z0-9]+    { snazzle_lval.sval = strdup(yytext); return STRING; }
%%
