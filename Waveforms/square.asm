// Squaere wave of 50% Duty Cycle. Frequency of square wave = 10KHz
// Start the Debug Session -> Go to View -> Analyzer Window -> setup (top left side) 
// -> click on 'new (inser)' (on top right side) -> change the alalog to bit -> start free RUN
ORG 0000H

MOV TMOD,#10H
HERE: MOV TH1,#0FFH
	  MOV TL1,#0CEH

CPL P1.5
ACALL DELAY
SJMP HERE

DELAY:  SETB TR1
AGAIN:  JNB TF1, AGAIN
	    CLR TR1
		CLR TF1
RET
END