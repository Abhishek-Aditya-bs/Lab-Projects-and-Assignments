a.out: dllmain.o A_PES1201900264_Week3b.o
		gcc A_PES1201900264_Week3b.o dllmain.o -lm

A_PES1201900264_Week3b.o: A_PES1201900264_Week3b.c dll.h
		gcc -c A_PES1201900264_Week3b.c -lm

dllmain.o: dllmain.c dll.h
		gcc -c dllmain.c -lm