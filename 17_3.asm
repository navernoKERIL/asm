%include "st_io.inc"
section .text
global _start

_start:
    GETUN eax
    call fibonacci

    SIGNINT eax
    PUTCHAR 10
    FINISH

fibonacci:
    push ebp
    mov ebp, esp 
    push ebx
    
    cmp eax, 0
    je .zero
    cmp eax, 1
    je .one

    push eax
    dec eax 
    call fibonacci

    mov ebx, eax
    pop eax
    sub eax, 2

    call fibonacci
    add eax, ebx 
    jmp .exit

.zero:
    mov eax, 0
    jmp .exit

.one:
    mov eax, 1

.exit:
    pop ebx 
    mov esp, ebp 
    pop ebp 
    ret
