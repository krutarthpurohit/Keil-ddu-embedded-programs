//Program to reverse the array

ORG 0000H
MOV R0,#20H
MOV R1,#24H
MOV R2,#05H

NEXT: MOV A,@R0
	  XCH A,@R1
	  MOV @R0,A
	  INC R0
	  DEC R1
	  DJNZ R2,NEXT
	  HERE: SJMP HERE
END
