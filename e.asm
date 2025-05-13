%include "st_io.inc"

section .text
    global _start

_start:
    push dword 1
    push dword 2
    push dword 3
    push dword 0
    push dword 5
    push dword 6
    push dword 7
    push dword 0
    push dword 0
    push dword 10

    xor al, al
    mov ecx, 10
if:
    pop ebx
    cmp ebx, 0
    jne next
	inc al 
next:
    loop if

    cbw
    cwde

    SIGNINT eax
    PUTCHAR 10

    FINISH
