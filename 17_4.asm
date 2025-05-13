%include "st_io.inc"
section .text
global _start

_start:
    GETUN eax
    push eax
    call fibonacci
    add esp, 4

    SIGNINT eax
    PUTCHAR 10
    FINISH

fibonacci:
    push ebp
    mov ebp, esp 
    push ebx
    push esi
     
    mov eax, [ebp+8]
    
    cmp eax, 0
    je .zero
    cmp eax, 1
    je .one

    dec eax 
    push eax
    call fibonacci
    add esp, 4
    mov esi, eax       

    mov eax, [ebp+8]  

    sub eax, 2
    push eax
    call fibonacci
    add esp, 4         
    add eax, esi        
    jmp .exit

.zero:
    mov eax, 0
    jmp .exit

.one:
    mov eax, 1

.exit:
    pop esi
    pop ebx 
    mov esp, ebp 
    pop ebp 
    ret