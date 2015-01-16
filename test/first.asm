%include "example/asm_io.inc"

segment .data

promt1 db "Enter a number: ", 0
outmsg1 db "You entered: ", 0

segment .bss

input1 resd 1

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
	mov [input1], eax
	
	mov eax, outmsg1
	call print_string

	mov eax, [input1]

	call print_int	

	popa
	mov eax, 0
	leave
	ret
