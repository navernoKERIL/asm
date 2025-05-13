section .data
    prompt db "Введите 10 чисел: ", 0
    format db "%d", 0
    output db "Элемент %d: %d", 10, 0
    newline db 10, 0

section .bss
    array resd 10      

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

    mov rcx, 10     
    lea rbx, [array] 
input_loop:
    push rcx
    push rbx

    lea rdi, [format]
    mov rsi, rbx  
    xor eax, eax      
    call scanf

    pop rbx
    pop rcx

    add rbx, 4     
    loop input_loop

    mov rcx, 10        
    xor rbx, rbx       
    lea r12, [array]  
output_loop:
    lea rdi, [output]
    mov rsi, rbx    
    mov edx, [r12]    

    push rcx
    xor eax, eax     
    call printf
    pop rcx          

    add r12, 4        
    inc rbx       
    loop output_loop

    mov rsp, rbp
    pop rbp
    xor eax, eax    
    ret