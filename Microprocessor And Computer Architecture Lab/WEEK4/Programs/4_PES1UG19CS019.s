.text

MOV R0,#2 ;Row number of the element to be accessed 
MOV R1,#2 ;Col number of the element to be accessed
MOV R2,#3 ;No. of elements per row

;Storing the location in Register R3
MLA R3,R0,R2,R1

;Storing the result in Register R5
LDR R4,=A;
LDR R5,[R4,R3,LSL #2]

SWI 0x011


.data

A: .word 1,2,3,4,5,6,7,8,9
