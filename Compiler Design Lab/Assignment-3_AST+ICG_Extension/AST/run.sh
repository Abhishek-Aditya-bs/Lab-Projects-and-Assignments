#!/bin/bash
lex lexer.l
yacc -d parser.y
gcc -c abstract_syntax_tree.c
gcc -g -w y.tab.c lex.yy.c abstract_syntax_tree.o -ll -ly

rm lex.yy.c
rm y.tab.c
rm y.tab.h
rm -rf output.txt

echo "File test_input_1.c" >> output.txt
./a.out < test_input_1.c >> output.txt
echo " " >> output.txt
echo "File test_input_2.c" >> output.txt
./a.out < test_input_2.c >> output.txt
echo " " >> output.txt
echo "File test_input_3.c" >> output.txt
./a.out < test_input_3.c >> output.txt
echo " " >> output.txt
