%include "st_io.inc"

section .data
    S1 db "abc*def*gh", 0   
    len equ $ - S1
section .text
    global _start

_start:
    mov ecx, len          
    mov edi, S1   
    xor esi, esi       
search_loop:
    mov al, [edi]        
    cmp al, '*'           
    jne not_found
    mov esi, edi 
not_found:             
    inc edi               
    loop search_loop   

    cmp esi, 0
    jne found 

    PRINT "NO '*'"
    PUTCHAR 10
    jmp end

found:
    mov byte [esi], '+'  

    mov eax, 4          
    mov ebx, 1          
    mov ecx, S1          
    mov edx, len         
    int 0x80
    
    PUTCHAR 10

end:
    FINISH
              