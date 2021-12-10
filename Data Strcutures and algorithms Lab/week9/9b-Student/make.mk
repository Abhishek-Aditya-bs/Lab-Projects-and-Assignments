a.out: heapmain.o A_PES1201900264_Week9b.o
		gcc A_PES1201900264_Week9b.o heapmain.o -lm

A_PES1201900264_Week9b.o: A_PES1201900264_Week9b.c heap.h
		gcc -c A_PES1201900264_Week9b.c -lm

heapmain.o: heapmain.c heap.h
		gcc -c heapmain.c -lm
