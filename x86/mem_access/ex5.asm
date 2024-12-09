global _start

section .data
addr    db "yellow"; db is 1 byte
len     equ $ - addr

section .text; alter contents of string at runtime

_start:
	mov [addr], byte 'H'
	mov [addr+len-1], byte '!'

	mov eax, 4; sys_write
	mov ebx, 1; stdout
	mov ecx, addr
	mov edx, len
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
