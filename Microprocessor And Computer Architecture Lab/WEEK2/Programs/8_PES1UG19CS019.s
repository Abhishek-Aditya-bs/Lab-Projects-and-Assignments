.data
	A: .WORD 10
	B: .WORD 15
.text
    
    LDR R0,=A   ;Storing address of A in R0
    LDR R1,=B   ;Storing address of B in R1
    
    LDR R2,[R0] ;Storing the value of R0 in R2
    LDR R3,[R1] ;Storing the value of R1 in R3
    
    ADD R4,R2,R3    ;R4 = R2+R3 = A+B
    ADD R5,R3,R3,LSL #1 ;R5 = R3+2*R3 = 3*R3 (3*B) 
    ADD R4,R4,R5 ;R4 = R4+R5 = (A+B)+(3*B) = Result
    
    SWI 0x011    
.end


	
