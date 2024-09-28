//Transfer the data from (CODE Memory) ROM Memory to INTERNAL Register Memory
//We can perform only 'READ' operation from External ROM (Read Only Memory)
org 0000h	
MOV DPTR,#0003H;
MOVC A,@A+DPTR;
END