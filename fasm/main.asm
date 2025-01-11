format ELF64 executable

;;  0 - stdin
;;  1 - stdout
;;  2 - stderr

entry _start
_start:
    ;; int3
    mov r15, 10

.again:
    cmp r15, 0
    jle .over
	    mov rax, 1
  	    mov rdi, 1
  	    mov rsi, hello
  	    mov rdx, hello_len
  	    syscall
        dec r15
    jmp .again

.over:
    mov rax, 60
    mov rdi, 0
    syscall

;; "=" can be forward referenced
hello: file "message.txt"
hello_len = $-hello
