        AREA    RESET, DATA, READONLY
        EXPORT  __Vectors
__Vectors
        DCD     0x10001800     ; Dirección de inicio del stack
        DCD     Reset_Handler  ; Vector de reset

        ALIGN
        AREA    MI_PROGRAMA, CODE, READONLY
        EXPORT  Reset_Handler
Reset_Handler
        LDR     R0, =0x10000000
        LDRH	R1,[R0]; CARGAMOS #DATOS(1º Y 2º)
		ADDS	R0,#2
		LDRB	R2,[R0]; CARGAMOS EL RESULTADO DE LA XOR
		MOVS		R3,#0
		MOVS		R4,#0
		
load_data 
		CMP 	R3,R1
		BHS		end_load
		ADDS 	R0,#1
		LDRB 	R5,[R0]
		EORS	R4,R5
		ADDS 	R3,#1
		B 		load_data
		
		
		
		
end_load
		CMP		R4,R2
		BEQ   	if_noerror
		LDR		R0, 	=0xFFFFFFFF
		B		forever
if_noerror
		LDR		R0, 	=0x00000000
		
forever
        B       forever

        END
