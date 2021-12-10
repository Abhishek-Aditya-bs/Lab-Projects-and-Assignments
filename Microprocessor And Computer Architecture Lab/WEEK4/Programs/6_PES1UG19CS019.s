.text

MOV R0,#0 ;Row number of the element to be accessed 
MOV R1,#0 ;Col number of the element to be accessed
MOV R2,#3 ;No. of elements per row
MOV R6,#0 ;Resulting Sum

L1:

L2:

;Storing the location in Register R3
MLA R3,R0,R2,R1

;Storing the result in Register R5
LDR R4,=A;
LDR R5,[R4,R3,LSL #2]
ADD R6,R6,R5
ADD R1,R1,#1
CMP R1,#3
BNE L2

ADD R0,R0,#1
MOV R1,#0
CMP R0,#3
BNE L1


SWI 0x011


.data

A: .word 1,2,3,4,5,6,7,8,9
