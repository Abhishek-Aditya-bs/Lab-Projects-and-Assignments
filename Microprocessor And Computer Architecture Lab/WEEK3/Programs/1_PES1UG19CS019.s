.data
    A: .word 13,11
    B: .word 14,19
    C: .word 0
.text
    LDR R0,=A ;address of 1st word is stored in R0
    LDR R1,=B ;address of 2nd word is stored in R1
    
    LDR R2,[R0] ;Storing 1st word in A in R2
    LDR R3,[R0,#4] ;Storing 2nd word in A in R3
    
    LDR R4,[R1] ;Stroring 1st word in B in R4
    LDR R5,[R1,#4] ;Storing 2nd word in B in R5
    
    ADDS R6,R3,R5 ;Adding the 2nd words in A and B and updating CPSR flags
    ADC R7,R2,R4 ;Adding the 1st words in A and B with Carry from previous addition
    
    LDR R0,=C   ;Storing address of C in R0
    STR R7,[R0] ;Storing the 1st word of sum in C
    STR R6,[R0,#4] ;Storing the 2nd word of sum in (C+4)
    
    swi 0x011
.end
    

