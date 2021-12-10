.data
    A: .BYTE 17,28,39,41,5,61,77,1,92,100  

.text

    LDR R0,=A   ;Storing address of A in R0
    MOV R1,#10  ;R1 stores the no. of elements
    MOV R3,#0   ;R3 stores the final sum
    
    ;Store the element of array in R2 and move R0 to refer to next element
    LOOP: LDRB R2,[R0],#1
          ADD R3,R2,R3  ;R3 = R2 + R3
          SUB R1,R1,#1  ;Decrement the no. of elements to be added
          CMP R1,#0 
          
          BNE LOOP  ;If count is not 0,repeat the process
          
          SWI 0x011
.end
          
