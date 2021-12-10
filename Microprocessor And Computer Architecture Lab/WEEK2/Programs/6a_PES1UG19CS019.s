.data
    A: .WORD 1,22,34,45,56,26,99,67,70,51  
.text

    LDR R0,=A   ;Storing address of A in R0
    MOV R1,#10  ;R1 stores the no. of elements
    MOV R3,#0   ;R3 stores the final sum
    
    LOOP: LDR R2,[R0]   ;Store the element of array in R2
          ADD R0,R0,#4  ;Move R0 to refer to next element in the array
          ADD R3,R2,R3  ;R3 = R2 + R3
          SUB R1,R1,#1  ;Decrement the no. of elements to be added
          CMP R1,#0 
          
          BNE LOOP  ;If count is not 0,repeat the process
          
          SWI 0x011
.end