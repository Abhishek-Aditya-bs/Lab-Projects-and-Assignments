a.out: 5amain.o A_PES1201900264_Week5.o
		gcc A_PES1201900264_Week5.o 5amain.o -lm

A_PES1201900264_Week5.o: A_PES1201900264_Week5.c 5a.h
		gcc -c A_PES1201900264_Week5.c -lm

5amain.o: 5amain.c 5a.h
		gcc -c 5amain.c -lm