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
    push dword 2   
    push dword 9
    push dword 10

    mov ecx, 9      
    mov esi, esp   
    xor eax, eax  

check_duplicates:
    mov ebx, [esi] 
    mov edx, ecx   
    mov edi, esi   
    add edi, 4     

cycle:
    cmp ebx, [edi]
    jne next
    mov ax, 1     
    jmp end
next:
    add edi, 4     
    dec edx     
    jnz cycle

    add esi, 4     
    loop check_duplicates

end:
    cbw          
    cwde 
    SIGNINT eax   
    PUTCHAR 10

    FINISH