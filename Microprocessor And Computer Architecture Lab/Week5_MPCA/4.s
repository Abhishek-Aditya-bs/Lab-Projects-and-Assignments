.data
A: .asciz "Hellooo Wooorld"
B: .asciz "o"
C: .asciz "Character o is Present \n"
D: .asciz "Character o is not Present"

.text
LDR R0,=C
LDR R1,=A
LDR R3,=B
LDR R7,=D
MOV R5,#0
LDRB R6,[R3],#1
LOOP:
LDRB R2,[R1],#1
CMP R2,#0
BNE L1
CMP R5,#0
BNE L3
MOV R0,R7
SWI 0X02
B END

L1: CMP R2,R6
    BEQ L2
    B LOOP
L2: ADD R5,R5,#1
    B LOOP
L3: SWI 0X02
    B END
END: MOV R0,#1
     MOV R1,R5
     SWI 0x6b
     SWI 0X011
.end
    
    