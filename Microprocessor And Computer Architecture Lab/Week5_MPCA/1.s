.data
A: .asciz "Subject Code\tMarks\nSUBJECT1\t90\nSUBJECT2\t93\nSubject3\t78\n\nTOTAL MARKS SCORED: 261/300\nPERCENTAGE: 87%\nGRADE: A"
.text
LDR R0,=A
SWI 0X02
SWI 0X011
.end