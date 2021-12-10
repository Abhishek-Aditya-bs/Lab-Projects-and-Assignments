.data
    A: .HWORD 23
    B: .HWORD 22
    C: .HWORD 0
.text

    LDR R0,=A   ;Store address of 1st no.
    LDR R1,=B   ;Store address of 2nd no.
    LDR R2,=C   ;Store address of result

    LDRH R4,[R0]    ;Store value of A in R4
    LDRH R3,[R1]    ;Store value of B in R3
    ADD R5,R3,R4    ;The result of A+B is stored in R5
    STRH R5,[R2]    ;Store the value of R5 in C
    SWI 0x011
.end



