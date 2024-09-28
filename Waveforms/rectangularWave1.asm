// Rectangular Wave. 
// T(ON) = 2ms and T(OFF) = 10 ms

// Start the Debug Session -> Go to View -> Analyzer Window -> setup (top left side) 
// -> click on 'new (inser)' (on top right side) -> change the alalog to bit -> start free RUN
ORG 0000H

MOV TMOD,#10H
HERE: MOV TH1,#0F8H
	  MOV TL1,#030H

SETB P1.0
ACALL DELAY
CPL P1.0
ACALL DELAY
ACALL DELAY
ACALL DELAY
ACALL DELAY
ACALL DELAY

SJMP HERE

DELAY:  SETB TR1
AGAIN:  JNB TF1, AGAIN
	    CLR TR1
		CLR TF1
RET
END