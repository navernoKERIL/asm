%include "st_io.inc"

section .text
    global _start

_start:
    GETUN eax          
    push eax           
    call factorial     
    add esp, 4         
    
    SIGNINT eax    
    PUTCHAR 10    
    FINISH            

factorial:
    push ebp          
    mov ebp, esp
    push ebx           
    
    mov eax, [ebp+8]   
    
    cmp eax, 1         
    jle .base
    
    mov ebx, eax       
    dec eax           
    push eax           
    call factorial     
    add esp, 4         
    
    mul ebx             
    jmp .exit

.base:
    mov eax, 1       

.exit:
    pop ebx          
    mov esp, ebp
    pop ebp
    ret