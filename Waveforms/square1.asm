// Squaere wave of 50% Duty Cycle. Frequency of square wave = 1KHz
// Start the Debug Session -> Go to View -> Analyzer Window -> setup (top left side) 
// -> click on 'new (inser)' (on top right side) -> change the alalog to bit -> start free RUN
ORG 0000H

MOV TMOD,#01H
HERE: MOV TH0,#0FEH
	  MOV TL0,#033H

CPL P2.0
ACALL DELAY
SJMP HERE

DELAY:  SETB TR0
AGAIN:  JNB TF0, AGAIN
	    CLR TR0
		CLR TF0
RET
END