        AREA    RESET, DATA, READONLY
        EXPORT  __Vectors
__Vectors
        DCD     0x10001800     ; Dirección de inicio del stack
        DCD     Reset_Handler  ; Vector de reset

        ALIGN
        AREA    MI_PROGRAMA, CODE, READONLY
        EXPORT  Reset_Handler
Reset_Handler
        LDR     R0, =0x10000008
        MOVS    R1, #8
        MOVS    R2, #0
		MOVS	R3, #0
		LDR		R4, =0X10000010
		STRB	R3, [R4]
		
bucle

        LDRB	R5, [R0]
        LSRS    R5, #1
        BCC		salto2
		
salto1

		SUBS	R1, #1
		BEQ		fin
		ADDS	R2, #1
		ADDS	R0, #1
		B		bucle
		
salto2

		ADDS	R3, #1
		STRB	R3, [R4]
		B		salto1

fin
        B       fin

        END
