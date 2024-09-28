// Square Wave in MODE 2. Freq of square wave = 10KHz

// Start the Debug Session -> Go to View -> Analyzer Window -> setup (top left side) 
// -> click on 'new (inser)' (on top right side) -> change the alalog to bit -> start free RUN
ORG 0000H

MOV TMOD,#02H
MOV TH0,#9CH

SETB P1.0
SETB TR0

REPEAT:
HERE: JNB TF0, HERE
	  CPL P1.0
	  CLR TF0;
SJMP REPEAT
END