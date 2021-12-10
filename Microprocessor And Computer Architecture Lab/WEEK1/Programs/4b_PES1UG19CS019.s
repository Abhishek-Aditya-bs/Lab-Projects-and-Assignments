;To check if a number stored in a register is even or odd
;If the number is even then store 00 in r0 else store FF in r0

mov r1,#12 ;value 12 is stored in the register r1
ands r2,r1,#1 ;performing Logical and of value stored in r1 & 1 and updating flags
cmp r2,#0 ;Checking if the value in r2 is 0 , by comparing the value in r2 and 0

beq label ;If the value in r2 is 0, then the number is even, jump to label

mov r0,#0xFF ;If the number is odd, store FF in r0
b end ;jump to end, after storing

label: mov r0,#0x00 ;If the number is even, store 00 in r0

end: swi 0x11 


