%include "st_io.inc"

section .data

section .text
    global _start

_start:
    mov eax, 1
    mov ebx, 2
    mov ecx, 3
    mov edx, 4
    mov ebp, 5
    mov esi, 6
    mov edi, 7
    
    pushad

    mov dword [esp + 28], 11

    popad

    SIGNINT eax
    PUTCHAR 10
       
    FINISH
