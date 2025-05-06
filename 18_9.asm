%include "st_io.inc"

section .data
    s db "a1b2c3d4e5f6g7h8i9j0", 0 
    len equ $ - s        

section .text
    global _start

_start:
    mov esi, s     
    mov ecx, len     

change_loop:
    lodsb                   
    cmp al, '0'          
    jbe skip            
    cmp al, '9'
    ja skip           
    
    sub al, '1'          
    add al, 'a'           
    mov [esi-1], al    
    
skip:
    loop change_loop      


    mov eax, 4            
    mov ebx, 1           
    mov ecx, s     
    mov edx, len     
    int 0x80

    PUTCHAR 10

    FINISH
