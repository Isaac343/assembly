list p=16f84a
include <p16f84a.inc>

TIME EQU H'0C'				;declara variable TIME
ORG 0

INICIO	bsf STATUS,RP0		;diccionario 0
		clrf TRISB			;puerto b -> salida
		bcf STATUS,RP0		;diccionario 0

ACTION	call TABLA7SEG
		movwf PORTB
		call DELAY
GOTO ACTION

TABLA7SEG:                  ; retlw b'gfedcba'  para display catodo comun
    addwf	PCL,1           ; Se incrementa el contador del programa
	retlw	b'0000001'      ; 0
	retlw	b'1001111'      ; 1
	retlw	b'0010010'      ; 2
	retlw	b'0000110'      ; 3
	retlw	b'1001100'      ; 4
	retlw	b'0100100'      ; 5
	retlw	b'0100000'      ; 6
	retlw	b'0001111'      ; 7
	retlw	b'0000000'      ; 8
	retlw	b'0000100'      ; 9
	clrf	ContadorDisplay ; Si llega 10, se resetea contador
	retlw	b'0000001'      ; 0

DELAY			movlw D'100'	;declarar contador
				movwf TIME		;W -> TIME
	DECREMENTO	decfsz TIME		;decrementar TIME
				goto DECREMENTO	;ir a DECREMENTO
RETURN 							;salir de la subrutina

END
