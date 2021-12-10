.data
A: .asciz "MynameISABHISHEK"

.text
MOV R10,#0
LDR R0,=A
LOOP:
LDRB R1,[R0],#1
CMP R1,#0
BNE L1
B END

L1: ADD R10,R10,#1
    B LOOP
END: SWI 0X011
.end
