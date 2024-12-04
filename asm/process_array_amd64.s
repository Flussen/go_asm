#include "textflag.h"

TEXT ·ProcessArray(SB), NOSPLIT, $0

    MOVQ array+0(FP), SI        
    MOVQ length+8(FP), CX       
    MOVL increment+16(FP), R8   

    XORQ AX, AX                 
    TESTQ CX, CX                
    JE loop_end                 

loop_start:
    CMPQ AX, CX                 
    JGE loop_end                

    MOVL 0(SI)(AX*4), R9        
    ADDL R8, R9                 
    MOVL R9, 0(SI)(AX*4)        

    INCQ AX                     
    JMP loop_start              

loop_end:
    RET                         
