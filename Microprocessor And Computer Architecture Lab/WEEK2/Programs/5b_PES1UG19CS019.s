.data
	A: .WORD 5
	B: .WORD 5
	C: .WORD 0
.text
    LDR R0,=A   ;Storing address of A in R0
    LDR R1,=B   ;Storing address of B in R1
    LDR R4,=C   ;Storing address of C in R4
    
    LDR R2,[R0] ;Storing value of A in R2
    LDR R3,[R1] ;Storing value of B in R3
    
    LABEL2: CMP R2,R3   ;Check if R2=R3
        BEQ LABEL0      ;If both are equal,end execution
        BMI LABEL1      ;If R3 > R2, branch to LABEL1 
        B LABEL3        ;If R2 > R3, branch to LABEL3
    
    LABEL1: SUB R3,R3,R2    ;R3 = R3-R2
        B LABEL2            ;Again compare values
    
    LABEL3: SUB R2,R2,R3    ;R2 = R2-R3
        B LABEL2            ;Again compare values
    
    LABEL0: STR R2,[R4] ;Store the value of R2(GCD) in memory(C)
        SWI 0x011
.end
        

