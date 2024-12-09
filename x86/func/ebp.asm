global _start

_start:
	call func
	mov  eax, 1
	mov  ebx, 0
	int  0x80

func:
	mov ebp, esp; put return addr pushed by call in ebp
	sub esp, 2
	mov [esp], byte 'H'
	mov [esp+1], byte 'i'

	mov eax, 4
	mov ebx, 1
	mov ecx, esp
	mov edx, 2
	int 0x80

	mov esp, ebp
	ret
