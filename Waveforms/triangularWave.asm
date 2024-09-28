// Triangular Wave
ORG 0000H

CLR A
REPEAT:
ACENDING: MOV P0,A
	  INC A
	  ACALL DELAY
	  CJNE A,#0FFH,ACENDING

DECENDING: MOV P0,A
      DEC A
	  ACALL DELAY
	  CJNE A,#00H,DECENDING

SJMP REPEAT

DELAY: 
MOV R7,#250H
THR1: NOP
	  NOP
	  DJNZ R7,THR1
	  
RET
END