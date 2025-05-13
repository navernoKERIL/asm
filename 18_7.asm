%include "st_io.inc"

section .data
    S1 db "abcd*efgh", 0   
    len equ $ - S1
section .text
    global _start

_start:    
    cld
    mov edi, S1 
    mov al, '*'  
    mov ecx, len
    repne scasb     

    jne not_found
    
    mov byte [edi-1], '+'
    jmp print_result

not_found:
    PRINT "no '*'"
    PUTCHAR 10
    FINISH

print_result:
    mov eax, 4          
    mov ebx, 1          
    mov ecx, S1          
    mov edx, len         
    int 0x80
    
    PUTCHAR 10
    FINISH

              