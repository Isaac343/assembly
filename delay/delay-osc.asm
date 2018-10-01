list p=16f84a
include <p16f84a.inc>

TIME EQU H'0C'				;declara variable TIME
ORG 0

INICIO	bsf STATUS,RP0		;diccionario 0
		clrf TRISB			;puerto b -> salida
		bcf STATUS,RP0		;diccionario 0

ACTION	bsf PORTB,0			;B -> 1
		call RELAY			;llamar subrutina
		bcf PORTB,0			;B -> 0
		call RELAY			;llamar subrutina
		goto ACTION			;ir a ACTION

RELAY			movlw D'30'	;declarar contador
				movwf TIME	;W -> TIME
	DECREMENTO	decfsz TIME	;decrementar TIME
				goto DECREMENTO	;ir a DECREMENTO
RETURN 	;salir de la subrrutina
		
GOTO ACTION

END