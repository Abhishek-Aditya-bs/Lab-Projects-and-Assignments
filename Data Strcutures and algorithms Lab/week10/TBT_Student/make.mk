a.out: tbtmain.o A_PES1201900264_Week10.o
		gcc A_PES1201900264_Week10.o tbtmain.o -lm

A_PES1201900264_Week10.o: A_PES1201900264_Week10.c tbt.h
		gcc -c A_PES1201900264_Week10.c -lm

tbtmain.o: tbtmain.c tbt.h
		gcc -c tbtmain.c -lm
