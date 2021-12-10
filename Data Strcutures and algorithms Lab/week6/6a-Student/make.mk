a.out: 6amain.o A_PES1201900264_Week6a.o
		gcc A_PES1201900264_Week6a.o 6amain.o -lm

A_PES1201900264_Week6a.o: A_PES1201900264_Week6a.c 6a.h
		gcc -c A_PES1201900264_Week6a.c -lm

6amain.o: 6amain.c 6a.h
		gcc -c 6amain.c -lm