%include "asm_io.inc"

segment .data

segment .bss

segment .text
	global asm_main
	global shellsort

asm_main:
	enter 0,0
	pusha
	
	;left this blank

	popa
	mov eax, 0
	leave
	ret

;it is assumed that parameters are already on the stack
shellsort:
	;allocate space for 4 local variables, in the order gap, i, j, temp
	enter 16,0

	;take n  store it in the local variable	
	mov eax, [ebp + 12]
	mov [ebp - 4], eax
	dump_regs 0
	;outmost for loop
gaploop:
	;take gap and divide it by 2
	mov eax, [ebp - 4]
	mov dword ebx, 2
	mov dword edx, 0
	div ebx
	mov [ebp - 4], eax
	dump_regs 1

	;ensure gap is greater than 0
	cmp dword [ebp - 4], 0
	jle near endsort

	;assign the new value of i
	mov eax, [ebp - 4]
	mov [ebp - 8], eax

	jmp gaploop
endsort:
	dump_regs 3
	leave 
	ret
