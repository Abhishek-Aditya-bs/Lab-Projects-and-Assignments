a.out: bfsmain.o A_PES1201900264_Week11b.o
		gcc A_PES1201900264_Week11b.o bfsmain.o -lm

A_PES1201900264_Week11b.o: A_PES1201900264_Week11b.c bfs.h
		gcc -c A_PES1201900264_Week11b.c -lm

bfsmain.o: bfsmain.c bfs.h
		gcc -c bfsmain.c -lm
