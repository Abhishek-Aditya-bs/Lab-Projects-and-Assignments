a.out: hashmain.o A_PES1201900264_Week12.o
		gcc A_PES1201900264_Week12.o hashmain.o -lm

A_PES1201900264_Week12.o: A_PES1201900264_Week12.c hash.h
		gcc -c A_PES1201900264_Week12.c -lm

hashmain.o: hashmain.c hash.h
		gcc -c hashmain.c -lm
