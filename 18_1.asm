%include "st_io.inc"

section .data
    str_1 db "123456", 0
    len_1 equ $ - str_1
    str_2 db "asdfgh", 0
    len_2 equ $ - str_2
    newline db 10

section .text
    global _start

_start:
    mov esi, str_1
    mov edi, str_2
    mov ecx, len_1

    rep movsb 

    mov eax, 4
    mov ebx, 1
    mov ecx, str_1
    mov edx, len_1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, str_2
    mov edx, len_2
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
