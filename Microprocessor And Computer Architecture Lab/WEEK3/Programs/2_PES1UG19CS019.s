.data
	A: .word 5,6,8,7,90
	B: .word 0
.text
	LDR R0,=A ;address of A is stored in R0
	LDR R1,=B ;address of B is stored in R1
	
	LDMIA R0,{R2-R6} ;Load the values from memory & store them in registers R2 to R6
	STMIA R1,{R2-R6} ;Store the values in registers R2 to R6 in memory
	
	SWI 0x011
	
.end