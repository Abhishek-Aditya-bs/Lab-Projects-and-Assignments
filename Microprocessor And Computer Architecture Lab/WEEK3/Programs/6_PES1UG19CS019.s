.data
    A: .word 0
.text
    MOV R0,#10 ;Number of elements in the series to be generated after 0 and 1
    LDR R1,=A ;Store the address of A in R1
    MOV R2,#0 ;Storing first no. in the fib series
    MOV R3,#1 ;Storing second no. in the fib series
    
    STR R2,[R1],#4 ;Store 0 in array and increment R1
    STR R3,[R1],#4 ;Store 1 in array and increment R1
    
    LOOP: ADD R4,R2,R3 ;Calculate the next fib no.
          STR R4,[R1],#4 ;Store the calculated fib no. in the array
          MOV R2,R3 ;Store the next fib no. R3 in R2
          MOV R3,R4 ;Store the new fib no. R4 in R3
          SUBS R0,R0,#1 ;Decrement the count of elements & updating CPSR flags
          BNE LOOP ;Generate the next fib no.
  
          SWI 0x011 ;If all elements generated,end the execution
.end
