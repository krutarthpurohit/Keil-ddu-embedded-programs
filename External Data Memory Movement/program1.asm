org 0000h
//EXTERNAL DATA MEMORY MOVEMENT
//->Only R0, R1 and DPTR can be used as pointer to access data bytes from external RAM
//->DPTR is a 16 bit register
//->Memonics for external data transfer is 'MOVX'

//WRITE OPERATION
MOV DPTR,#1000H;
MOV A,#10H;
MOVX @DPTR,A;

//READ OPERATION
MOVX A,@DPTR;  //OVERWRITE X:0x1000=AF ON THIS STEP WHILE DEBUGGING 

END