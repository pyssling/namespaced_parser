%{
#include <stdio.h>
%}

%option prefix="snazzle_"
%option noyywrap

%%
[ \t\n]         ;
[0-9]+\.[0-9]+  { printf( "Found a floating-point number: %s\n", yytext); }
[0-9]+          { printf( "Found an integer: %s\n", yytext); }
[a-zA-Z0-9]+    { printf( "Found a string %s\n: ", yytext); }
%%
