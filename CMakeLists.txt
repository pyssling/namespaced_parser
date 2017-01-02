CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

INCLUDE_DIRECTORIES( . )

ADD_CUSTOM_COMMAND( OUTPUT snazzle_parse.c snazzle_parse.h COMMAND
  bison --output=snazzle_parse.c --defines=snazzle_parse.h ${CMAKE_CURRENT_LIST_DIR}/snazzle_parse.y
  DEPENDS ${CMAKE_CURRENT_LIST_DIR}/snazzle_parse.y )

ADD_CUSTOM_COMMAND( OUTPUT snazzle_lex.c snazzle_lex.h COMMAND
  flex --outfile=snazzle_lex.c --header-file=snazzle_lex.h ${CMAKE_CURRENT_LIST_DIR}/snazzle_lex.l
  DEPENDS ${CMAKE_CURRENT_LIST_DIR}/snazzle_lex.l )

ADD_EXECUTABLE( namespaced_parser snazzle_parse.c snazzle_lex.c namespaced_parser.c )
