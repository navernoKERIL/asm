%include "st_io.inc"

section .data
    str_1 db "1234567890", 0
    str_2 db "abcdefghij", 0
    len dd 10
    newline dd 10

section .text
    global _start

_start:

    mov edi, str_1 + 2
    mov esi, str_2 + 4
    mov ecx, 4
    cld
    rep movsb

    mov eax, 4
    mov ebx, 1
    mov ecx, str_1
    mov edx, [len]
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, str_2
    mov edx, [len]
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
