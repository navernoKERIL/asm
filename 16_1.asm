%include "st_io.inc"    

section .data
    a dd 5              
    b dd 3              
    c dd 0              

    label dd summ

section .text
    global _start

_start:
    mov eax, [a]        
    mov ebx, [b]

    mov edx, skip
    jmp [label]
    skip:
    
    mov eax, [c]        
    SIGNINT eax         
    PUTCHAR 10          
    FINISH 

summ:
    push ebp
    mov ebp, esp

    add eax, ebx        
    mov [c], eax

    mov esp, ebp
    pop ebp
    jmp edx
