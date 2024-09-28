//PUSH POP behaviour on SP register
ORG 0000h
LJMP MAIN

ORG 1234H
main:
MOV A,#05H
MOV B,#02H		//sp = 7
LCALL SUBR  	//sp = 9
EXIT: SJMP EXIT

SUBR: PUSH ACC  //sp = 10 ~ A
PUSH B			//sp = 11 ~ B
PUSH PSW		//sp = 12 ~ C
DIV AB
MOV R0,A
MOV R1,B
POP PSW			//sp = B 
POP B			//sp = A
POP ACC			//sp = 9
RET 			//sp = 7

END