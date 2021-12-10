a.out: polymain.o A_PES1201900264_Week3a.o
		gcc A_PES1201900264_Week3a.o polymain.o -lm

A_PES1201900264_Week3a.o: A_PES1201900264_Week3a.c poly.h
		gcc -c A_PES1201900264_Week3a.c -lm

polymain.o: polymain.c poly.h
		gcc -c polymain.c -lm