#!/bin/bash
lex lexer.l
gcc -c quad_generation.c
yacc -d parser.y
gcc -g y.tab.c lex.yy.c quad_generation.o -ll -ly

rm lex.yy.c
rm y.tab.c
rm y.tab.h

rm -f -- icg_quad.txt
touch icg_quad.txt

echo "Test Input 1" >> icg_quad.txt
echo " " >> icg_quad.txt 
./a.out < test_input_1.c
echo "Test Input 2" >> icg_quad.txt
echo " " >> icg_quad.txt 
./a.out < test_input_2.c