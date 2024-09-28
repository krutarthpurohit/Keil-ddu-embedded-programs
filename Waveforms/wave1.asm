//  1 ms high pule .. 2 ms low pulse .. 2ms high pulse .. 5 ms low pulse
// |<----------------------------10ms--------------------------------->|    <repeat>
ORG 0000H
MOV TMOD,#10H
REPEAT:
		SETB P1.0
		ACALL DELAY
		
		CPL P1.0
		ACALL DELAY
		ACALL DELAY	

		CPL P1.0
		ACALL DELAY
		ACALL DELAY	
		
		CPL P1.0
		ACALL DELAY
		ACALL DELAY	
		ACALL DELAY	
		ACALL DELAY	
		ACALL DELAY	
		
SJMP REPEAT

DELAY:  MOV TH1,#0FCH
		MOV TL1,#18H
		SETB TR1
HERE:  JNB TF1,HERE
	   CLR TF1
	   CLR TR1
RET

END