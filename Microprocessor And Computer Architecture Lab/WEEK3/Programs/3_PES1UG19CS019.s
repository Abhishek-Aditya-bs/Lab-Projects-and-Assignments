.data
    A: .word 144,55,26,19,321
.text
    LDR R0,=A ;address of A is stored in R0
    LDR R5,[R0] ;Register R5 is used to store the smallest number in the array
    
    MOV R1,#5 ;Register R1 is used to store the number of elements in the array
    
    LOOP: CMP R1,#0 ;Check if R1 is 0
          BEQ END ;If R1 is 0 then all elements have been processed
          
          LDR R2,[R0],#4 ;Load a value from A in R2 and increment R0 by 4
          
          CMP R2,R5 ;Compare the current min value and element fetched
          BMI SMALL ;If result is negative, element is smaller than min value
          
          SUB R1,R1,#1 ;Decrementing count of elements
          B LOOP ;Process the next element
          
    SMALL: MOV R5,R2 ;Update the new min value
            SUB R1,R1,#1 ;Decrementing count of elements
            B LOOP ;Process the next element in the array
          
    END: SWI 0x011      
.end

