.text

    MOV R1,#0
    MOV R0,#7   ;Store value 7 in R0
    ADD R1,R0,R0,LSL #5  ;R1 = R0 + 32*R0 = 33*R0
    ADD R1,R1,R0,LSL #1  ;R1 = R1 + 2*R0 = 35*R0
    
.end
    
