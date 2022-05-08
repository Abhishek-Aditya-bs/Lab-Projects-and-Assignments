#!/bin/bash

gcc -c sym_tab.c 
lex lexer.l
yacc -d parser.y -Wno
gcc -g y.tab.c lex.yy.c sym_tab.o -ll -ly 

rm -rf output1.txt
rm -rf output2.txt
rm -rf output3.txt

echo "Sample Input 1 File" >> output1.txt
echo " " >> output1.txt
./a.out<sample_input1.c>>output1.txt
echo "Sample Input 2 File" >> output2.txt
echo " " >> output2.txt
./a.out<sample_input2.c>>output2.txt
echo "Sample Input 3 File" >> output3.txt
echo " " >> output3.txt
./a.out<sample_input3.c>>output3.txt
