%include "asm_io.inc"

segment .data

segment .bss

stringlabel resb 100

segment .text
	global asm_main

asm_main:
	enter 0,0
	pusha
	
		
	
	popa
	mov eax, 0
	leave
	ret

readstring:
	enter 0,0
	push ebx

	

	pop ebx
	leave
	ret
