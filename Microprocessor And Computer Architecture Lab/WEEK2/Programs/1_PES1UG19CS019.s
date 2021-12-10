.text
MOV R0,#-7 ;Storing -7 in register R0
CMP R0,#0 ;Comparing R0 with 0
BEQ LABEL1 ;Number is 0
BMI LABEL2 ;Number is -ve
MOV R1,#2 ;Number is +ve
SWI 0X11
LABEL1:
	MOV R1,#1 
	SWI 0X11
LABEL2:
	MOV R1,#3
	SWI 0X11
.end