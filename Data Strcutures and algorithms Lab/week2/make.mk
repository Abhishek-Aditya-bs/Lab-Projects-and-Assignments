a.out: main.o A_PES1201900264_Week2.o
		gcc A_PES1201900264_Week2.o main.o -lm

A_PES1201900264_Week2.o: A_PES1201900264_Week2.c sll.h
		gcc -c A_PES1201900264_Week2.c -lm

main.o: main.c sll.h
		gcc -c main.c -lm