//Write an instruction or a set of instructions to transfer a byte from internal RAM location 7H to external RAM location 0007H, 0010H and 0100H

ORG 0000H

MOV 7H,#0FFH;
MOV A,7H;

MOV DPTR,#0007H;
MOVX @DPTR,A;

MOV DPTR , #0010H;
MOVX @DPTR,A;

MOV DPTR,#0100H;
MOVX @DPTR,A;

END