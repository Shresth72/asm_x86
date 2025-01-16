format ELF64 executable

;;  0 - stdin
;;  1 - stdout
;;  2 - stderr

hello: file "message.txt"
hello_len = $-hello

another: db "Goodbye!", 0xA
another_len = $ - another

print:
    mov r9, -3689348814741910323
    sub rsp, 40
    mov BYTE [rsp+31], 10
    lea rcx, [rsp+30]
.L2:
    mov rax, rdi
    lea r8, [rsp+32]
    mul r9
    mov rax, rdi
    sub r8, rcx
    shr rdx, 3
    lea rsi, [rdx+rdx*4]
    add rsi, rsi
    sub rax, rsi
    add eax, 48
    mov BYTE [rcx], al
    mov rax, rdi
    mov rdi, rdx
    mov rdx, rcx
    sub rcx, 1
    cmp rax, 9
    ja .L2
    lea rax, [rsp+32]
    mov edi, 1
    sub rdx, rax
    xor eax, eax
    lea rsi, [rsp+32+rdx]
    mov rdx, r8
    mov rax, 1
    syscall
    add rsp, 40
    ret

macro for i, again, over { ;; counter addr, labels..
    mov QWORD [i], 0
again 
    cmp QWORD [i], 10
    jge over
}

macro endfor i, again, over {
    inc QWORD [i]
    jmp again
over:
}

entry _start
_start:

    mov rsi, hello
    mov rdx, hello_len
    call print_str

    lea rsi, [another] ;; Load Affective Address
    mov rdx, another_len
    call print_str

    for i, 1, 10
        for j, 1, 10
            mov rdi, QWORD [i]
            add rdi, QWORD [j]
            call print
        endfor j
    endfor i

.over:
    mov rax, 60
    mov rdi, 0
    syscall

print_str:
    mov rax, 1  ;; syscall number for write
    mov rdi, 1  ;; file descriptor: stdout
    syscall     ;; perform syscall
    ret         ;; return to caller
