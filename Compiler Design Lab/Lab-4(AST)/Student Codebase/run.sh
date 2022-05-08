#!/bin/bash

gcc -c abstract_syntax_tree.c 
lex lexer.l
yacc -d parser.y -Wno
gcc -g y.tab.c lex.yy.c abstract_syntax_tree.o -ll -ly

rm lex.yy.c
rm y.tab.c
rm y.tab.h

rm -rf test_output_1.txt
rm -rf test_output_2.txt

./a.out < test_input_1.c> test_output_1.txt
./a.out < test_input_2.c> test_output_2.txt


# yacc -d parser.y -Wno
# gcc -g y.tab.c lex.yy.c abstract_syntax_tree.o -ll -ly 