global _start

_start:
	mov eax, 1; exit system call
	mov ebx, 42; exit status
	sub ebx, 29
	int 0x80; interuppt for system call
