%include "st_io.inc"

section .data
    str_1 db 'ab234ggh', 0
    str_2 db '12345678', 0    

section .text
    global _start

_start:
    
    mov esi, str_1 + 2    
    mov edi, str_2 + 1    
    mov ecx, 4           
    repz cmpsb     

    jne not_equal         
 
    PRINT "YES"
    PUTCHAR 10
    jmp end

not_equal:
    PRINT "NO"
    PUTCHAR 10

end:
    FINISH
