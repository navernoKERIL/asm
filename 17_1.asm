%include "st_io.inc"

section .text
    global _start

_start:
    GETUN eax
    call factorial

    SIGNINT eax
    PUTCHAR 10
    FINISH

factorial:
    push ebp
    mov ebp, esp    
    push ebx

    cmp eax, 1
    jle .base
    
    mov ebx, eax
    dec eax
    call factorial
    mul ebx

    jmp .exit

.base:
    mov eax, 1

.exit:
    pop ebx
    mov esp, ebp
    pop ebp
    ret
