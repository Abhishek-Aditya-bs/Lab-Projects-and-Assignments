a.out: etmain.o A_PES1201900264_Week9a.o
		gcc A_PES1201900264_Week9a.o etmain.o -lm

A_PES1201900264_Week9a.o: A_PES1201900264_Week9a.c et.h
		gcc -c A_PES1201900264_Week9a.c -lm

etmain.o: etmain.c et.h
		gcc -c etmain.c -lm
