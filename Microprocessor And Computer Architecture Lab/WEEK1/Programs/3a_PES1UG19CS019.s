;Adding 5 values(operands) present in registers r0,r1,r2,r3,r4

mov r0,#12 ;Storing value 12 in r0
mov r1,#6 ;Storing value 6 in r1
mov r2,#3 ;Storing value 3 in r2
mov r3,#8 ;Storing value 8 in r3
mov r4,#1 ;Storing value 1 in r4

add r5,r0,r1 ; r5 = r0+r1
add r6,r5,r2 ;r6 = r5+r2 = r0+r1+r2
add r7,r6,r3 ;r7 = r6+r3 = r0+r1+r2+r3
add r8,r7,r4 ;r8 = r7+r4 = r0+r1+r2+r3+r4

swi 0x11
