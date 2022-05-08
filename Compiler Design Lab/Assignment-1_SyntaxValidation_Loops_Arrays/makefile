LEX=lex
YACC=yacc
YACC_FLAGS=-d -v
CC=gcc
LD_FLAGS=-ll -ly

all: lexer parser
	$(CC) lex.yy.c y.tab.c $(LD_FLAGS)

lexer:
	$(LEX) lexer.l 

parser:
	$(YACC) $(YACC_FLAGS) parser.y

clean:
	rm -rf y.tab.c y.tab.h lex.yy.c *.o *.output
	@echo "\033[92mCleaned!\033[0m";