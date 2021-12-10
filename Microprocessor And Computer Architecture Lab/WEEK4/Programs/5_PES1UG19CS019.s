.data

A: .byte 1,2,3,4,2,3,1,2,1
B: .byte 1,1,1,2,2,2,3,3,3
C: .byte 0,0,0,0,0,0,0,0,0

.text

MOV R0,#0 ;Row number of the element to be accessed 
MOV R1,#0 ;Col number of the element to be accessed
MOV R2,#3 ;No. of elements per row

L1:

L2:

;Storing the location in Register R3
MLA R3,R0,R2,R1

;Storing the result in Register R5
LDR R4,=A;
LDRB R5,[R4,R3]

LDR R6,=B;
LDRB R7,[R6,R3]

ADD R8,R5,R7
LDR R9,=C
STRB R8,[R9,R3]


ADD R1,R1,#1
CMP R1,#3
BNE L2

ADD R0,R0,#1
MOV R1,#0
CMP R0,#3
BNE L1


SWI 0x011




