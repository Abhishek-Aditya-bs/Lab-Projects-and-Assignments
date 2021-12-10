MOV R0,#10 ;Value of a
MOV R1,#20 ;Value of b
AND R2,R1,#15 ;(b & 15)
ORR R3,R2,R0,LSL #2 ;R3 = z

SWI 0x011
