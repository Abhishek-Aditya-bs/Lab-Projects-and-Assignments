.text

    MOV R0,#8  ;Value 8 is stored in R0
    MOV R1,#5  ;Value 5 is sored in R1

    CMP R0,R1   ;Check if values are equal

    BEQ LABEL0      ;If equal,branch to L0

    SUB R2,R0,R1    ;If not equal,subtract the values
    B LABEL1

    LABEL0: ADD R2,R0,R1    ;If equal,add the values
    B LABEL1

    LABEL1: SWI 0x011

.end
