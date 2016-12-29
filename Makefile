
namespaced_parser : namespaced_parser.o snazzle_lex.o snazzle_parse.o

snazzle_parse.o : snazzle_lex.h

namespaced_parser.o: snazzle_parse.h snazzle_lex.h

%.c %.h : %.l
	flex --outfile=$(basename $<).c --header-file=$(basename $<).h $<

%.c %.h : %.y
	bison --output=$(basename $<).c --defines=$(basename $<).h $<
