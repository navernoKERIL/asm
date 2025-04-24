%include "st_io.inc"

section .text
    global _start

_start:
    push dword 1
    push dword 2
    push dword 3
    push dword 4
    push dword 5
    push dword 6
    push dword 7
    push dword 8
    push dword 9
    push dword 10

    pushad          

    mov eax, [esp + 32]  
    mov ebx, [esp + 36]
    mov [esp + 32], ebx
    mov [esp + 36], eax           

    mov ecx, 18
print_loop:
    pop ebx
    SIGNINT ebx
    PUTCHAR 10
    dec ecx
    cmp ecx, 0
    jne print_loop

    FINISH