.data
	A: .word -1,99,22,-230,0
.text
    LDR R0,=A ;Storing address of A in R0
    
    MOV R2,#5 ;Number of elements in the array
    
    MOV R3,#0 ;Storing the no. of 0's in array
    MOV R4,#0 ;Storing the no. of positive elements in the array
    MOV R5,#0 ;Storing the no. of negative elements in the array
    
    LOOP: 
        CMP R2,#0 ;Check if all elements have been processed
        BEQ END
        
        SUB R2,R2,#1 ;Decrement the no. of elements to process
        
        LDR R1,[R0] ;Load an element from A to R1
        MOVS R1,R1 ;Update the flags for the element
        BEQ ZERO ;If element is 0
        BMI NEGATIVE ;If element is negative

        ADD R4,R4,#1 ;If element is positive,increment the count(R4)
        ADD R0,R0,#4 ;Update R0 to next element in array
        B LOOP ;Process the next element
        
    ZERO:
        ADD R3,R3,#1 ;Increment the count(R3)
        ADD R0,R0,#4 ;Update R0 to next element in array
        B LOOP ;Process the next element
        
    NEGATIVE:
        ADD R5,R5,#1 ;Increment the count(R5)
        ADD R0,R0,#4 ;Update R0 to next element in array
        B LOOP ;Process the next element  

    END: SWI 0x011
.end

	
	
