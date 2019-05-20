org 100h

INCLUDE "emu8086.inc"

MOV     DX, OFFSET MAIN
MOV     AH, 9
INT     21H

MOV     DX, OFFSET MSG1
MOV     AH,9
INT     21H
CALL    SCAN_NUM
MOV     AX,CX

MOV     DX, OFFSET MSG2
MOV     AH,9
INT     21H
CALL    SCAN_NUM
MOV     BX,CX
 
CALL    PTHIS 
        db 13,10, "ANS = ", 0
CALL    DIVIDE
CALL    PRINT_NUM
ret

MAIN DB "PROGRAM CALCULATES THE QUOTIENT. $"
MSG1 DB 13,10, "NUMERATOR: $"
MSG2 DB 13,10, "DENOMINATOR: $"

DEFINE_SCAN_NUM
DEFINE_PTHIS
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS


DIVIDE PROC 
    iDIV BX
    RET
ENDP
