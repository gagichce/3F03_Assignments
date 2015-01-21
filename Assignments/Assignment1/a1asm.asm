%include "asm_io.inc"

segment .data

promt1 db "Enter the value of x: ", 0
outmsg1 db "y = ", 0

segment .bss

x resd 0

segment .text
	global asm_main

asm_main:
	enter 0,0
	pusha
	;print the promt
	mov eax, promt1
	call print_string
	call read_int

	;move input to its place
	mov [x], eax
	mov ebx, 0
	dump_regs 1
	mov ebx, [x]

	;subtract 3
	sub ebx, 3 
	
	imul ebx, [x]

	add ebx, 1

	imul ebx, [x]

	sub ebx, 10
	
	dump_regs 1
	mov eax, outmsg1
	call print_string

	mov eax, ebx

	call print_int	
	call print_nl
	popa
	mov eax, 0
	leave
	ret
