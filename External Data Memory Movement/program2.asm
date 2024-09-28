//Transfer data from external RAM location- 0007H to internal RAM location- 7H.

org 0000h
MOV DPTR,#0007H;
MOV A,#15H;
MOVX @DPTR,A;

MOVX A,@DPTR;
MOV 7H,A;
END
