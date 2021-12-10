.text 

    MOV R0,#7 ;Storing 7 in register R0

    MOV R1,R0

    LOOP: SUB R0,R0,#1  ;R0 = R0-1
          MUL R2,R0,R1  ;storing the result of n*(n-1) in R2
          MOV R1,R2
          CMP R0,#1 ;If R0 is 1,break out of loop
          BNE LOOP
      
    SWI 0x011

.end
