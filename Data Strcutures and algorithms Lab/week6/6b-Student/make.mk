a.out: 6bmain.o A_PES1201900264_Week6b.o
		gcc A_PES1201900264_Week6b.o 6bmain.o -lm

A_PES1201900264_Week6b.o: A_PES1201900264_Week6b.c 6b.h
		gcc -c A_PES1201900264_Week6b.c -lm

6bmain.o: 6bmain.c 6b.h
		gcc -c 6bmain.c -lm