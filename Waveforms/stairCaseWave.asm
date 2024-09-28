//Stair Case Waveform
ORG 0000H

REPEAT: MOV A,#00H
		MOV P0,A
		
BACK: MOV P0,A
	  ADD A,#25H
	  CJNE A,#13H,BACK
	  
SJMP REPEAT
END