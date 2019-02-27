        AREA    RESET, DATA, READONLY
        EXPORT  __Vectors
__Vectors
        DCD     0x10001800     ; Dirección de inicio del stack
        DCD     Reset_Handler  ; Vector de reset

        ALIGN
        AREA    MI_PROGRAMA, CODE, READONLY
        EXPORT  Reset_Handler
Reset_Handler
        	LDR     R0, 	=0x10000008
        	MOVS    R1,	#8 ;este es limite del bucle de 8 a cero
        	MOVS    R2, 	#0; numero que compramos con r1 para salir del bucle
		MOVS	R3, 	#0; contador de numeros impares
		LDR	R4,	=0X10000010
		STRB	R3, 	[R4]
		
bucle

        	LDRB	R5, [R0]; cargamos la direccion apuntada por r0 a r5
        	LSRS    R5, #1; dividimos r5 entre dos para ver su paridad
        	BCC	salto2; si es impar, se desplazara un uno, activandose el flag de carry y saltamos al salto 2
		
salto1

		SUBS	R1,	 #1; en caso de se par, restamos uno al contador
		BEQ	fin	   ; si r1 lleg a ocho saltamos a fin
		ADDS	R2, 	 #1; contador de ciclos
		ADDS	R0,    	 #1;aumentamos el puntero
		B		bucle
		
salto2

		ADDS	R3, #1; como el numero ha sido impar, aumentamos el contador
		STRB	R3, [R4]; movemos a la direecion apuntada por r4, el numero de impares 
		B	salto1

fin
        B       fin

        END
