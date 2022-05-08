#!/bin/bash

lex lexer.l
yacc -d parser.y -Wno
gcc -c sym_tab.c
gcc -g y.tab.c lex.yy.c sym_tab.o -ll

rm -rf output1.txt

echo "Sample Input 1 File" >> output1.txt
./a.out < sample_input1.c >> output1.txt
echo " " >> output1.txt
echo "Sample Input 2 File" >> output1.txt
./a.out < test2.c >> output1.txt
echo " " >> output1.txt

