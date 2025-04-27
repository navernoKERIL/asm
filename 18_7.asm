%include "st_io.inc"

section .data
    S1 db "abcdefgh", 0   
    len equ $ - S1
section .text
    global _start

_start:
    mov ecx, len          
    mov edi, S1          
search_loop:
    mov al, [edi]        
    cmp al, '*'           
    je found             
    inc edi               
    loop search_loop    

    PRINT "NO '*'"
    PUTCHAR 10
    jmp end

found:
    mov byte [edi], '+'  

    mov eax, 4          
    mov ebx, 1          
    mov ecx, S1          
    mov edx, len         
    int 0x80
    
    PUTCHAR 10

end:
    FINISH
              