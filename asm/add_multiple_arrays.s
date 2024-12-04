#include "textflag.h"

TEXT ·AddMultipleArrays(SB), NOSPLIT, $0


    MOVQ arrays+0(FP), R8        
    MOVQ numArrays+8(FP), R9     
    MOVQ length+16(FP), R10      
    MOVQ result+24(FP), R11      

    MOVQ (R8), R8                
    MOVQ (R11), R11              

    XORQ R12, R12                
    XORQ R13, R13                

init_result:
    CMPQ R12, R10                
    JGE loop_arrays
    MOVL $0, (R11)(R12*4)        
    INCQ R12
    JMP init_result

loop_arrays:
    XORQ R12, R12                
    CMPQ R13, R9                 
    JGE loop_end

    MOVQ (R8)(R13*8), R14       

loop_elements:
    CMPQ R12, R10                
    JGE next_array

    MOVL (R14)(R12*4), R15       
    ADDL R15, (R11)(R12*4)       
    INCQ R12
    JMP loop_elements

next_array:
    INCQ R13                     
    JMP loop_arrays

loop_end:
    RET
