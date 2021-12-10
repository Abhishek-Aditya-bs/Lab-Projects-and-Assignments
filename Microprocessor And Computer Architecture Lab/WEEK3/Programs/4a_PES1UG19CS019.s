.text
	LDR R0, =0b00010111011010101010011000001110 
	MOV R2, #32 ;Register R2 is used to store Number of digits in the number
	MOV R5, #0  ;Register R5 is used to store the no. of 1's in the number
	
	LOOP:
		SUB R2, R2, #1 ;Decrementing the number of digits

		;Performing Logical Right Shift on the number and updating the flags
		MOVS R0, R0, LSR #1 
		
		ADDCS R5, R5, #1 ;Check if the digit is 1 and update R5
		
		CMP R2, #0 ;Check if all digits are processed
		BNE LOOP
	
	MOV R2, #32 
	SUB R6,R2, R5 ;No. of 0's is stored in Register R6 = 32 - No. of 1's
	SWI 0x011
.end
