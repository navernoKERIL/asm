%include "st_io.inc"

section .data
    A dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    B dw -1, -2, -3, -4, -5, -6, -7, -8, -9, -10
    len dd 10

section .text
    global _start

_start:

    mov esi, A
    mov edi, B
    mov ecx, [len]
    cld
    rep movsw

    mov ecx, [len]
    lea esi, A
print_loop:
    movsx eax, word [esi]
    add esi, 2
    SIGNINT eax
    PUTCHAR 32
    dec ecx
    cmp ecx, 0
    jne print_loop
    
    PUTCHAR 10

    mov ecx, [len]
    lea esi, B
print_loop_2:
    movsx eax, word [esi]
    add esi, 2
    SIGNINT eax
    PUTCHAR 32
    dec ecx
    cmp ecx, 0
    jne print_loop_2

    PUTCHAR 10

    FINISH
