a.out: cllmain.o A_PES1201900264_Week4.o
		gcc A_PES1201900264_Week4.o cllmain.o -lm

A_PES1201900264_Week4.o: A_PES1201900264_Week4.c cll.h
		gcc -c A_PES1201900264_Week4.c -lm

cllmain.o: cllmain.c cll.h
		gcc -c cllmain.c -lm