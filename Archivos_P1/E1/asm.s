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
        LDR     R1, =0x10000004
        LDR     R2, =0x10000010

        LDR    R3, [R0]
        LDR    R4, [R1]
        ADDS   R5, R3, R4
        STR    R5, [R2]
forever
        B       forever

        END
