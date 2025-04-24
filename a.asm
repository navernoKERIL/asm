%include "st_io.inc"

section .text
    global _start

_start:
    push dword 1
    push dword 0
    push dword 3
    push dword 0
    push dword 5
    push dword 0
    push dword 7
    push dword 0
    push dword 9
    push dword 0


    mov ecx, 10
    xor edx, edx   
    xor esi, esi
count_loop:
    cmp dword [esp + esi * 4], 0
    jne not_zero
    inc edx
not_zero:
    inc esi
    dec ecx
    cmp ecx, 0
    jne count_loop

    mov ecx, 10
    mov edi, esp  

filter_loop:
    pop eax
    cmp eax, 0
    je skip_store
    mov [edi], eax 
    sub edi, 4     
skip_store:
    loop filter_loop

    lea esp, [edi+4]

    mov ecx, 10
    sub ecx, edx
print_loop:
    test ecx, ecx
    jz exit
    pop eax
    SIGNINT eax
    PUTCHAR 10
    dec ecx
    jmp print_loop

exit:
    FINISH