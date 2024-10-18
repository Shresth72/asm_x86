global _start

section .text

_start:
	mov ebx, 1; start ebx at 1
	mov ecx, 6; number of iterations

label:
	add ebx, ebx
	dec ecx; ecx -= 1
	cmp ecx, 0
	jg  label

	mov eax, 1; sys_exit system call
	int 0x80
