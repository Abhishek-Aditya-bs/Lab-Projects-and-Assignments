.data 
A: .word 1,2,3,4,5,6,7,8,9

.text
MOV R0,#0;Row number
MOV R1,#0;Column number
MOV R2,#3;No.of elements per row
MOV R7,#0;total sum

L1:

L2:

MLA R3,R0,R2,R1;offset calculation

LDR R4,=A;base address
LDR R5,[R4,R3,LSL #2]
ADD R7,R7,R5

ADD R1,R1,#1
CMP R1,#3
BNE L2

ADD R0,R0,#1
MOV R1,#0
CMP R0,#3
BNE L1

SWI 0x011
