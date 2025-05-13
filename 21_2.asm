section .data
    prompt db "Введите x (db), y (dw), z (dd): ", 0
    format db "%hhd %hd %d", 0   
    output_u db "x = %3hhu, y = %8hu, z = %10u", 10, 0  
    output_s db "x = %3hhd, y = %8hd, z = %10d", 10, 0 
    newline db 10, 0

section .bss
    x resb 1      
    y resw 1    
    z resd 1     

section .text
    global main
    extern printf, scanf

main:
    push prompt
    call printf
    add esp, 4

    push z
    push y
    push x
    push format
    call scanf
    add esp, 16   

    cmp eax, 3
    jne exit

    movsx eax, byte [x]
    push eax
    movsx eax, word [y]
    push eax
    push dword [z]
    push output_u
    call printf
    add esp, 16

    movsx eax, byte [x]
    push eax
    movsx eax, word [y]
    push eax
    push dword [z]
    push output_s
    call printf
    add esp, 16

exit:
    mov eax, 1   
    xor ebx, ebx  
    int 0x80