#include "textflag.h"

TEXT ·ProcessArray(SB), NOSPLIT, $0
    // Parámetros:
    // array: primer argumento (puntero al array) en SI
    // length: segundo argumento (longitud del array) en CX
    // increment: tercer argumento (valor a sumar) en DX

    MOVQ array+0(FP), SI        // Dirección base del array en SI
    MOVQ length+8(FP), CX       // Longitud del array en CX
    MOVL increment+16(FP), R8   // Incremento a sumar en R8 (32 bits)

    XORQ AX, AX                 // AX = índice (contador)
    TESTQ CX, CX                // Verifica si length == 0
    JE loop_end                 // Si el array está vacío, salir

loop_start:
    CMPQ AX, CX                 // Comparar índice con la longitud
    JGE loop_end                // Si índice >= longitud, salir del bucle

    // Leer elemento actual
    MOVL 0(SI)(AX*4), R9        // Leer elemento en el índice AX
    ADDL R8, R9                 // Sumar incremento al elemento
    MOVL R9, 0(SI)(AX*4)        // Escribir el resultado de vuelta al array

    INCQ AX                     // Incrementar índice
    JMP loop_start              // Volver al inicio del bucle

loop_end:
    RET                         // Retornar
