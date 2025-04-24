%include "st_io.inc"

section .data
    array dd 5, 2, 8, 1, 9, 3, 7, 4, 6, 10  
    array_len dd 10        

section .text
    global _start

_start:
    push dword [array_len]
    push array
    call find_min
    
    SIGNINT eax
    PUTCHAR 10
    FINISH

find_min:
    push ebp            
    mov ebp, esp        

    mov esi, [ebp + 8]  
    mov ecx, [ebp + 12] 
    mov eax, [esi]      

    cmp ecx, 0
    je end     

find_min_loop:        
    dec ecx             
    jz end     

    add esi, 4  
    cmp eax, [esi]      
    jle find_min_loop       
    mov eax, [esi]      
    jmp find_min_loop       

end:
    mov esp, ebp        
    pop ebp             
    ret
