;Program using ARM instruction set to subtract two 32 bit numbers stored in registers

mov r0,#-22 ;Storing value -22 in the register r0
mov r1,#8 ;Storing value 8 in the register r1

;the result of subtraction of values(operands) stored in r0 and r1 is stored in r2
sub r2,r0,r1

swi 0x11
