// Count the number of positive, negative and zeros present in the array of size 10.
MOV DPTR,#0400H
MOV R7,#10H
MOV A,#00H

MOV R2,A
MOV R3,A
MOV R4,A

NEXT: MOVX A,@DPTR
	  RLC A
	  JC NEG  // IF C=1 THEN NEGATIVE NUMBER
	  RRC A
	  ADD A,#0FFH
	  JC POS
	  INC R3  //Zero counter
	  SJMP UPDATE

POS: INC R2   //Positive counter
	 SJMP UPDATE
NEG: INC R4   //Negative counter

UPDATE: INC DPTR
	  DJNZ R7,NEXT
	  HERE: SJMP HERE
END