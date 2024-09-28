//WAP a program to copy 3 bytes of data from the CODE Memory to the EXTERNAL RAM Memory 
//whose starting address is 100H of the CODE Memory and array starts after the memory.
//100->101->102->103
org 0000h
MOV DPTR,#100H;

MOVC A,@A+DPTR;
MOV R0,A;
INC DPTR;
CLR A;

MOVC A,@A+DPTR;
MOVX @R0,A;
INC DPTR;
CLR A;

MOVC A,@A+DPTR;
INC R0;
MOVX @R0,A;
INC DPTR;
CLR A;

MOVC A,@A+DPTR
INC R0;
MOVX @R0,A;

END