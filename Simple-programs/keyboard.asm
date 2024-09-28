$MOD51	; This includes 8051 definitions for the Metalink assembler

START:	MOV R0, #00		;// binary code for pressed key will be stored in R0
		MOV P2, #0FFH	;// configure P2 as I/P port
		MOV P1, #00H	;// ground all rows
NO_REL:   	MOV A, P2	
	            ANL A, #0FH	;	// mask upper nibble which is not used for keyboard
		CJNE A, #0FH, NO_REL		
;// if all keys are not high previous key is not released
		LCALL DBOUN	;// debounce for key release
WAIT:          	MOV A, P2 ;		// check for any key press and wait until key press	
	          	ANL A, #0FH
		CJNE A, #0FH, K_IDEN;	// key identify
		SJMP WAIT
K_IDEN:	LCALL DBOUN
		MOV R4, #7FH	;//only one row is made 0 at a time
		MOV R2, #04		;// row counter
		MOV A, R4
NXT_ROW: 	RL A
		MOV R4, A;		// save data to ground next row
		MOV P1, A;		// ground one row
		MOV A, P2		
		ANL A, #0FH;		// mask upper nibble
		MOV R3, #04		;// column counter
NXT_COLM: RRC A			;// move A0 bit in carry
		JNC KY_FND
		INC R0
		DJNZ R3, NXT_COLM
		MOV A, R4
		DJNZ R2, NXT_ROW
		SJMP WAIT		;// no key closure found, go back and check again
KY_FND:    	MOV A, R0	;	// hex code of key is in R0, store it in A
		SJMP CONTINUE
DBOUN:	MOV R6, #1		;// deboune delay for 10ms (Xtal=12MHz)
THR2:		MOV R7, #2
THR1:		NOP
		NOP
		DJNZ R7, THR1
		DJNZ R6, THR2
		RET

CONTINUE: 	MOV DPTR, #300H		;// address of look up table
MOV A, R0		;	// binary code of the key is in R0
MOVC A,@A+DPTR		;// access corresponding ASCII code
mov p3,a
SJMP START

ORG 300H			;// look up table
DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H, 7FH, 6FH , 5FH, 7CH,58H, 5EH, 79H, 71H
	



; Please insert your code here.

END