section .data
    prompt db "Введите x (db), y (dw), z (dd): ", 0
    format db "%hhd %hd %d", 0         
    output_u db "x = %3hhu, y = %8hu, z = %10u", 10, 0 
    output_s db "x = %3hhd, y = %8hd, z = %10d", 10, 0 

section .bss
    x resb 1    
    y resw 1    
    z resd 1    

section .text
    global main
    extern printf, scanf

main:

    push rbp
    mov rbp, rsp
    sub rsp, 32   

    lea rdi, [prompt]
    xor eax, eax   
    call printf

    lea rdi, [format]
    lea rsi, [x]
    lea rdx, [y]
    lea rcx, [z]
    xor eax, eax 
    call scanf

    cmp eax, 3
    jne exit

    lea rdi, [output_u]
    movzx esi, byte [x]  
    movzx edx, word [y]  
    mov ecx, [z]
    xor eax, eax
    call printf


    lea rdi, [output_s]
    movsx esi, byte [x] 
    movsx edx, word [y]
    mov ecx, [z]
    xor eax, eax
    call printf

exit:
    mov rsp, rbp
    pop rbp
    mov rax, 60
    xor rdi, rdi
    syscall