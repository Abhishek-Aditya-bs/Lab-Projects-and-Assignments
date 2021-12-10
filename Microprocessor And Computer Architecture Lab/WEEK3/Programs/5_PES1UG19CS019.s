.data
    A: .word 11,1,56,88,155
.text
    LDR R0,=A ;Storing the address of A in R0
    MOV R2,#88 ;Key element to be searched is stored in R2
    MOV R3,#5 ;No. of elements in the array is stored in R3
    
    L2: LDR R1,[R0],#4 ;Load a value from A to R1 and increment R0 to next element
        CMP R1,R2 ;Compare element and key
        BEQ FOUND ;If element = key, search successful
        
        SUBS R3,R3,#1 ;Decrement the count of elements & update flags
        BNE L2  ;Process the next element
        
        MOV R6,#-1 ;If all elements processed,search unsuccessful
        B END ;End execution
        
    FOUND:
        RSB R7,R3,#6 ;Store position of the element found in R7
        MOV R6,#1 ;Store 1 in R6 indicating successful search
        B END ;End execution
        
    END: SWI 0x011
.end
      

