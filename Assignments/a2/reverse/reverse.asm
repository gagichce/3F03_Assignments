%include "asm_io.inc"

segment .data

segment .bss

stringlabel resb 100


segment .text
	global asm_main

asm_main:
	enter 0,0
	pusha
	
	mov eax, stringlabel

	dump_regs 1

	call readstring	

	dump_regs 1	

	mov eax, stringlabel

	popa
	mov eax, 0
	leave
	ret

strlen:
	enter 0,0
	push ebx
	push eax

	mov ebx, eax
	mov eax, 0

	

	pop eax
	pop ebx
	leave
	ret

readstring:
	enter 0,0
	push ebx	
	push eax
	mov ebx, eax

readSection:
	dump_regs 1
	call read_char

	mov [ebx], eax	

	sub ebx, 4
	cmp eax, 0

	jne readSection
	
	pop eax
	pop ebx
	leave
	ret
