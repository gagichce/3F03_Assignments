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

	call readstring

	call strlen
	
	call print_int

	popa
	mov eax, 0
	leave
	ret

strlen:
	enter 0,0
	push ebx

	mov ebx, eax
	mov eax, 0

loops:
	cmp dword [ebx] , 0
	
	je short done

	sub ebx, 4
	add eax, 1
	jmp loops

done:
	pop ebx
	leave
	ret

readstring:
	enter 0,0
	push ebx	
	push eax
	mov ebx, eax

readSection:
	call read_char

	mov [ebx], eax	

	sub ebx, 4
	cmp eax, 0

	jne readSection
	
	call read_char
	pop eax
	pop ebx
	leave
	ret
