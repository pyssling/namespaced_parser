%{
#include <stdio.h>

typedef void* snazzle_scan_t;
#include "snazzle_common.h"
#include "snazzle_parse.h"

%}

%option prefix="snazzle_"
%option noyywrap
%option reentrant bison-bridge

%%
[ \t\n]         ;
[0-9]+\.[0-9]+  { yylval_param->fval = atof(yytext); return FLOAT; }
[0-9]+          { yylval_param->ival = atoi(yytext); return INT; }
[a-zA-Z0-9]+    { yylval_param->sval = strdup(yytext); return STRING; }
%%
