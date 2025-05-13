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
    push ebp
    mov ebp, esp

    push prompt
    call printf
    add esp, 4

    mov ecx, 10        
    mov ebx, array     
input_loop:
    push ecx            
    push ebx           
    push format
    call scanf
    add esp, 8          
    pop ecx             
    add ebx, 4          
    loop input_loop

    mov ecx, 10          
    mov ebx, 0           
    mov esi, array       
output_loop:
    push ecx             

    push dword [esi]    
    push ebx            
    push output         
    call printf
    add esp, 12         

    add esi, 4          
    inc ebx             
    pop ecx             
    loop output_loop

    mov eax, 1   
    xor ebx, ebx  
    int 0x80