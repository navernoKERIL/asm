%include "st_io.inc"

section .data
    a dd 1
    b dd 2
    c dd 0

section .text
    global _start

_start:
    mov eax, [a]
    mov ebx, [b]
    call summ
    SIGNINT [c]
    PUTCHAR 10

    mov eax, [a]
    mov ebx, [b]
    call subt
    SIGNINT [c]
    PUTCHAR 10
    
    FINISH

summ:
    push ebp
    mov ebp, esp

    add eax, ebx
    mov [c], eax

    pop ebp
    ret

subt:
    push ebp
    mov ebp, esp

    sub eax, ebx
    mov [c], eax

    pop ebp
    ret
