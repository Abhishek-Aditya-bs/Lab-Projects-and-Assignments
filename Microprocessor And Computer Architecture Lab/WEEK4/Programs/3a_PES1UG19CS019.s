.text

LDR R0,=A
LDR R1,=B
LDR R2,=C

MOV R3,#5 ;No of elements
MOV R7,#0 ;The convolution sum

LOOP: 
    LDR R4,[R0],#4
    LDR R5,[R1],#4
    MUL R6,R4,R5
    ADD R7,R7,R6
    SUBS R3,R3,#1
    BNE LOOP
    
    STR R7,[R2]
    
    SWI 0x011


.data

A: .word 10, 20, 30, 40, 50
B: .word 10, 20, 30, 40, 50
C: .word 0
