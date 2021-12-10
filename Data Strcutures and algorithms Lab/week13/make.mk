a.out: triemain.o A_PES1201900264_Week13.o
		gcc A_PES1201900264_Week13.o triemain.o -lm

A_PES1201900264_Week13.o: A_PES1201900264_Week13.c trie.h
		gcc -c A_PES1201900264_Week13.c -lm

triemain.o: triemain.c trie.h
		gcc -c triemain.c -lm
