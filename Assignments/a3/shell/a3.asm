%include "asm_io.inc"

segment .data

segment .bss

stringlabel resb 100

segment .text
	global asm_main

asm_main:
	enter 0,0
	pusha
	
	;left this blank

	popa
	mov eax, 0
	leave
	ret

;assuming eax is address of start of num array, ebx is length of array
shellsort:
	enter 0,0
	pusha
	
	push eax
	push ebx	

	popa
	leave 
	ret
