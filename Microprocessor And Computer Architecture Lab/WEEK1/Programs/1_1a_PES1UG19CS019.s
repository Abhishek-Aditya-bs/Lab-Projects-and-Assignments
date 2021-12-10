;Program using ARM instruction set to add two 32 bit numbers stored in registers

mov r0,#7  ;Storing 7 in the register r0
mov r1,#-5 ;Storing -5 in the register r1

;the result of addition of values(operands) stored in r0 and r1 is stored in r2
add r2,r0,r1

swi 0x11
