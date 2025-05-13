section .data
    prompt db "Введите 10 чисел (каждое с новой строки):", 0xA, 0
    input_format db "%d", 0
    output_format db "%d ", 0
    newline db 0xA, 0

section .bss
    array resd 10       ; Массив из 10 элементов (по 4 байта)

section .text
    global main
    extern printf, scanf

main:
    ; Пролог
    push ebp
    mov ebp, esp
    sub esp, 8          ; Выравнивание стека + место для временных переменных

    ; Вывод приглашения
    push prompt
    call printf
    add esp, 4

    ; Ввод массива
    mov esi, array      ; ESI = указатель на массив
    mov ecx, 0          ; Счётчик
input_loop:
    cmp ecx, 10
    jge input_done

    ; Вызов scanf
    push esi            ; Адрес текущего элемента
    push input_format
    call scanf
    add esp, 8

    ; Проверка успешности ввода (scanf возвращает 1 при успехе)
    cmp eax, 1
    jne input_error

    ; Следующий элемент
    add esi, 4
    inc ecx
    jmp input_loop

input_error:
    ; Очистка стека и выход при ошибке
    add esp, 8
    jmp exit

input_done:
    ; Вывод массива
    mov esi, array
    mov ecx, 0
output_loop:
    cmp ecx, 10
    jge output_done

    ; Вывод элемента
    push dword [esi]
    push output_format
    call printf
    add esp, 8

    ; Следующий элемент
    add esi, 4
    inc ecx
    jmp output_loop

output_done:
    ; Новая строка
    push newline
    call printf
    add esp, 4

exit:
    ; Эпилог
    mov esp, ebp
    pop ebp
    xor eax, eax    ; return 0
    ret