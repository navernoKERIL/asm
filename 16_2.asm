%include "st_io.inc"

section .data
    a dd 1
    b dd 2
    c dd 0

section .text
    global _start

_start:
    call summ
    SIGNINT [c]
    PUTCHAR 10

    call subt
    SIGNINT [c]
    PUTCHAR 10
    
    FINISH

summ:
    push ebp
    mov ebp, esp

    mov eax, [a]
    add eax, [b]
    mov [c], eax

    pop ebp
    ret

subt:
    push ebp
    mov ebp, esp

    mov eax, [a]
    sub eax, [b]
    mov [c], eax

    pop ebp
    ret
