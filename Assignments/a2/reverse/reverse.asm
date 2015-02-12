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

	call reverse

	mov eax, stringlabel	
	
	call print_char

	popa
	mov eax, 0
	leave
	ret

reverse:

	enter 0,0
	pusha

	mov eax, stringlabel

	call readstring

	call strlen

	sub eax, 1

	imul eax, 4	

	add eax, stringlabel	

	mov ebx, stringlabel

loopRev:

	;reverse the chars
	mov ecx, [eax]
	mov edx, [ebx]
	mov [ebx], ecx
	mov [eax], edx
	
	dump_regs 1

	add dword ebx, 4
	sub dword eax, 4

	cmp eax, ebx
	jg loopRev

	popa
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
