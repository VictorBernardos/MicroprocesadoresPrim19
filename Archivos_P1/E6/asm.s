        AREA    RESET, DATA, READONLY
        EXPORT  __Vectors
__Vectors
        DCD     0x10001800     ; Dirección de inicio del stack
        DCD     Reset_Handler  ; Vector de reset

        ALIGN
        AREA    MI_PROGRAMA, CODE, READONLY
        EXPORT  Reset_Handler
			
Reset_Handler
        	MOVS	R0,#0x0A
		MOVS	R1,#0x00
		B	Compara
Salto	
		ADDS	R1,R1,#5
		SUBS	R0,R0,#1
Compara	
		CMP	R0,#0x00	
		BNE	Salto
		
forever
        B       forever

        END
