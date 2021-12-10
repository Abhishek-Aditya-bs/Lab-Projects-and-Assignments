;Demonstration of Logical AND,OR,OR,XOR,NOT operations

mov r0,#5 ;Storing value 5 in r0
mov r1,#6 ;Storing value 6 in r1

;Logical AND operation
and r2,r0,r1

;Logical OR operation
orr r3,r0,r1

;Logical XOR operation
eor r4,r0,r1

;Logical NOT operation
mvn r5,r0

swi 0x11
