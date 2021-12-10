.data
    A: .WORD 10
    B: .WORD 50
    C: .WORD 0
.text

    LDR R0, =A  ;Storing address of 1st no.
    LDR R1, =B  ;Storing address of 2nd no.
    LDR R2, =C  ;Storing address of result
    
    LDR R4, [R0]    ;Storing value of A in R4
    LDR R3, [R1]    ;Storing value of B in R3
	
    ADD R5, R3, R4  ;The result of A+B is stored in R5
    
    STR R5, [R2]    ;Store the value of R5 in C
    SWI 0x011
.end


