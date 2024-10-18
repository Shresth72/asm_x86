global _start

section .data; section to store data
msg     db "Hello World!", 0x0a; new line
len     equ $ - msg; curr addr - start addr

section .text

_start:
	mov eax, 4; system call - 4 is sys_write
	mov ebx, 1; stdout file descriptor - 1 is stdout
	mov ecx, msg; bytes to write
	mov edx, len; number of bytes to write
	int 0x80; perform system call

	mov eax, 1; sys_exit system call
	mov ebx, 0; exit status is 0
	int 0x80
