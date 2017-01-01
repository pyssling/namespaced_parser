#include <stdio.h>

#define YYSTYPE SNAZZLE_STYPE
#include "snazzle_common.h"
#include "snazzle_parse.h"
#include "snazzle_lex.h"


int main(int argc, char* argv[])
{
  printf("Hello world\n");

  FILE *myfile = fopen("a.snazzle.file", "r");
  // make sure it is valid:
  if (!myfile) {
    printf("I can't open a.snazzle.file!");
    return -1;
  }

  yyscan_t myscanner;

  snazzle_lex_init(&myscanner);
  snazzle_set_in(myfile, myscanner);
  snazzle_set_debug (1 , myscanner );

  //snazzle_debug = 1;
  
  do {
    printf("running once\n");
      snazzle_parse(myscanner);
  } while (!feof(snazzle_get_in(myscanner)));
  snazzle_lex_destroy(myscanner);  
}
