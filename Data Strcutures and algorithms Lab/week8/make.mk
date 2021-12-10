a.out: bstmain.o A_PES1201900264_Week8.o
		gcc A_PES1201900264_Week8.o bstmain.o -lm

A_PES1201900264_Week8.o: A_PES1201900264_Week8.c bst.h
		gcc -c A_PES1201900264_Week8.c -lm

bstmain.o: bstmain.c bst.h
		gcc -c bstmain.c -lm
