a.out: queuemain.o A_PES1201900264_Week7.o
		gcc A_PES1201900264_Week7.o queuemain.o -lm

A_PES1201900264_Week7.o: A_PES1201900264_Week7.c queue.h
		gcc -c A_PES1201900264_Week7.c -lm

queuemain.o: queuemain.c queue.h
		gcc -c queuemain.c -lm
