#!/bin/bash

gcc -c quad_generation.c 
lex lexer.l
yacc -d parser.y -Wno
gcc -g y.tab.c lex.yy.c -ll quad_generation.o -ll -ly

rm lex.yy.c
rm y.tab.c
rm y.tab.h
rm -rf icg_quad_file.txt

echo "File Test_input_1.c" >> icg_quad_file.txt
./a.out < test_input_1.c
echo "" >> icg_quad_file.txt
echo "File Test_input_2.c" >> icg_quad_file.txt
./a.out < test_input_2.c