        AREA    RESET, DATA, READONLY
        EXPORT  __Vectors
__Vectors
        DCD     0x10001800     ; Dirección de inicio del stack
        DCD     Reset_Handler  ; Vector de reset

        ALIGN
        AREA    MI_PROGRAMA, CODE, READONLY
        EXPORT  Reset_Handler
Reset_Handler
		LDR		R0, =0x10000000
		LDRB	R1,[R0]; CARGAMOS EL DATO DE R0 EN R1
		ADDS 	R0,R0,#1; SUMAMOS 1 A LA DIRECCION PARA PASAR DE BASE A ALTURA
		LDRB	R2,[R0]; GUARDAMOS EN R2 EL CONTENIDO DE R0
		MOVS	R3,R2

		MULS	R3,R1,R3; MULTIPLICAMOS R1 Y R2 Y LO GUARDAMOS EN R3
		LSRS	R3, #1; DIVIDIMOS ENTRE , DESPLAZAMIENTO LOGICO A DERECHAS UNA POSICION
		ADDS	R0, #7; COMO ESTABA EN LA 100..01, LO MOVEMOS A LA 100..08
        STRH 	R3, [R0]
		
forever
        B       forever

        END
