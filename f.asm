%include "st_io.inc"

section .data
    s db "(2 + 3) * (5 - (1 + 2))", 0   
    ;s db "2 + 3) * (5 - 1", 0         

section .text
    global _start

_start:
    mov ebx, esp        

check_bracket:
    movzx eax, byte [s + ecx]  
    cmp eax, 0          
    je check_result

    cmp eax, '('        
    je open_bracket
    cmp eax, ')'        
    je close_bracket

    inc ecx             
    jmp check_bracket

open_bracket:
    push 1              
    inc ecx
    jmp check_bracket

close_bracket:
    cmp esp, ebx        
    je error            
    pop eax             
    inc ecx
    jmp check_bracket

check_result:
    cmp esp, ebx        
    je success          

error:
    PRINT "NO"
    FINISH

success:
    PRINT "YES"
    FINISH

