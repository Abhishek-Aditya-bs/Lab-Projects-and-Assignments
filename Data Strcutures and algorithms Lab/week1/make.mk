a.out: seq_search.o PES1UG19CS019_WEEK1.o
		gcc PES1UG19CS019_WEEK1.o seq_search.o -lm

PES1UG19CS019_WEEK1.o: PES1UG19CS019_WEEK1.c ss.h
		gcc -c PES1UG19CS019_WEEK1.c -lm

seq_search.o: seq_search.c ss.h
		gcc -c seq_search.c -lm