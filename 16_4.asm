%include "st_io.inc"

section .data
    a dd 2
    b dd 3
    c dd 0

section .text
    global _start



_start:
    push dword [a]
    push dword [b]
    call sum_numbers
    SIGNINT [c]
    PUTCHAR 10

    mov [a], dword 25
    mov [b], dword 14
    push dword [b]
    push dword [a]
    call sub_numbers
    SIGNINT [c]
    PUTCHAR 10
    
    FINISH

sum_numbers:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]

    add eax, ebx
    mov [c], eax

    pop ebp
    ret 8

sub_numbers:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]

    sub eax, ebx
    mov [c], eax

    pop ebp
    ret 8
