#ifndef _SNAZZLE_COMMON_H
#define _SNAZZLE_COMMON_H

#define YYDEBUG 1
#define SNAZZLE_DEBUG 1


union snazzle_stype_u {
  int ival;
  float fval;
  char *sval;
};

#define SNAZZLE_STYPE union snazzle_stype_u
#define YYSTYPE SNAZZLE_STYPE

//#define YY_DECL int yylex			\
//  (YYSTYPE * yylval_param, yyscan_t yyscanner)

typedef void* snazzle_scan_t;

#endif /* _SNAZZLE_COMMON_H */
