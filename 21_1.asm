    section .data
    newline db 10

section .bss
    s resb 255
    len resq 1

section .text
    global _start

_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, s
    mov rdx, 256
    syscall

    mov [len], rax
 
    mov rax, 1
    mov rdi, 1
    mov rsi, s
    mov rdx, [len]
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
     
    mov rax, 60
    xor rdi, rdi
    syscall
