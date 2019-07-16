
namespaced_parser : namespaced_parser.o snazzle_lex.o snazzle_parse.o

snazzle_parse.o : snazzle_lex.h snazzle_common.h snazzle_parse.c snazzle_parse.h

namespaced_parser.o: snazzle_parse.h snazzle_lex.h namespaced_parser.c snazzle_common.h

%.c %.h : %.l
	flex --outfile=$(basename $<).c --header-file=$(basename $<).h $<

%.c %.h : %.y
	bison --output=$(basename $<).c --defines=$(basename $<).h $<