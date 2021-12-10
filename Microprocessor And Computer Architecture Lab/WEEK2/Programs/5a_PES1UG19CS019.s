.text
    MOV R0,#30  ;Storing value 30 in R0
    MOV R1,#10  ;Storing value 10 in R1
    MOV R2,R0
    MOV R3,R1
    LABEL2: CMP R2,R3  ;Checking if R2=R3
        BEQ LABEL0      ;If both are equal,end execution
        BMI LABEL1      ;If R3 > R2, branch to LABEL1 
        B LABEL3        ;If R2 > R3, branch to LABEL3
    
    LABEL1: SUB R3,R3,R2    ;R3 = R3-R2
        B LABEL2            ;Again compare values
    
    LABEL3: SUB R2,R2,R3    ;R2 = R2-R3
        B LABEL2            ;Again compare values
    
    LABEL0: SWI 0x011
.end
