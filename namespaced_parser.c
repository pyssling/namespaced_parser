#include <stdio.h>
#include "snazzle_lex.h"
#include "snazzle_parse.h"

int main(int argc, char* argv[])
{
  printf("Hello world\n");

  FILE *myfile = fopen("a.snazzle.file", "r");
  // make sure it is valid:
  if (!myfile) {
    printf("I can't open a.snazzle.file!");
    return -1;
  }
  // set flex to read from it instead of defaulting to STDIN:
  snazzle_in = myfile;

  // parse through the input until there is no more:
  do {
    snazzle_parse();
  } while (!feof(snazzle_in));
  
}
