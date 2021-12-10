;Adding 5 values(operands) present in registers r0,r1,r2,r3,r4

mov r0,#71 ;Storing value 71 in r0
mov r1,#10 ;Storing value 10 in r1
mov r2,#32 ;Storing value 32 in r2
mov r3,#5 ;Storing value 5 in r3
mov r4,#13 ;Storing value 13 in r4

add r5,r0,r1 ;r5 = r0+r1
add r6,r5,r2 ;r6 = r5+r2 = r0+r1+r2
add r7,r6,r3 ;r7 = r6+r3 = r0+r1+r2+r3
add r8,r7,r4 ;r8 = r7+r4 = r0+r1+r2+r3+r4

swi 0x11
