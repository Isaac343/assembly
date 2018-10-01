list p=16f84a
include <p16f84a.inc>

TIME EQU H'0C'				;declara variable TIME
ORG 0

INICIO	bsf STATUS,RP0		;diccionario 0
		clrf TRISB			;puerto b -> salida
		bcf STATUS,RP0		;diccionario 0

ACTION	movlw B'1111110'	;B -> 0
		movwf TRISB			;
		call DELAY			;llamar subrutina
		movlw B'0110000'	;B -> 1
		movwf TRISB
		call DELAY			;llamar subrutina
		movlw B'1101101'	;B -> 2
		movwf TRISB
		call DELAY
		movlw B'1111001'	;B -> 3
		movwf TRISB
		call DELAY
		movlw B'0110011'	;B -> 4
		movwf TRISB
		call DELAY
		movlw B'1011011'	;B -> 5
		movwf TRISB
		call DELAY
		movlw B'1011111'	;B -> 6
		movwf TRISB
		call DELAY
		movlw B'1110000'	;B -> 7
		movwf TRISB
		call DELAY
		movlw B'1111111'	;B -> 8
		movwf TRISB
		call DELAY
		movlw B'1111011'	;B -> 9
		movwf TRISB
		call DELAY
		goto ACTION			;ir a ACTION

DELAY			movlw D'100'	;declarar contador
				movwf TIME	;W -> TIME
	DECREMENTO	decfsz TIME	;decrementar TIME
				goto DECREMENTO	;ir a DECREMENTO
RETURN 	;salir de la subrrutina
		
GOTO ACTION

END