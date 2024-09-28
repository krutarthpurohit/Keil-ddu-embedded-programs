//Write instructions to transfer the value 10H to internal RAM location 8H, external ram location 0008H and 0100H.

org 0000h
	
MOV A,#10H;
MOV DPTR,#0008H;
MOVX @DPTR,A;

MOV DPTR,#0100H;
MOVX @DPTR,A;

MOV 08H,#10H;
end