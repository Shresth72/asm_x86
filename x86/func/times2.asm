global _start

_start:
	push 21
	call times2
	mov  ebx, eax
	mov  eax, 1
	int  0x80

times2:
	push ebp; best prac
	mov  ebp, esp; preserve stack pointer
	mov  eax, [ebp+8]; use func args
	add  eax, eax; times 2
	mov  esp, ebp; restore stack pointer from ebp->esp
	pop  ebp; pop return addr
	ret
