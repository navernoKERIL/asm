%include "st_io.inc"

section .data
    A dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
    B dd 11, 22, 33, 44, 55, 66, 77, 88, 99, 100
    len dd 10

section .text
    global _start

_start:

    mov esi, A + 8
    mov edi, B + 4
    mov ecx, 3
    cld
    rep movsd

    mov ecx, [len]
    lea esi, A
print_loop:
    mov eax, [esi]
    add esi, 4
    SIGNINT eax
    PUTCHAR 32
    dec ecx
    cmp ecx, 0
    jne print_loop
    
    PUTCHAR 10

    mov ecx, [len]
    lea esi, B
print_loop_2:
    mov eax, [esi]
    add esi, 4
    SIGNINT eax
    PUTCHAR 32
    dec ecx
    cmp ecx, 0
    jne print_loop_2

    PUTCHAR 10

    FINISH
