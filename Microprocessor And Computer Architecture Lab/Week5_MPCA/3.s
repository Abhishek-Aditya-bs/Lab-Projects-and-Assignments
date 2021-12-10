.data
A: .asciz "Hello World"
B: .asciz " "

.text
LDR R1,=A
LDR R2,=B
LOOP:
LDRB R3,[R1],#1
CMP R3,#0
BNE L1
SWI 0X011

L1: STRB R3,[R2],#1
    B LOOP
.end


