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
	;add dword [eax + 8], 25
	;outmost for loop
gaploop:
	;take gap and divide it by 2
	mov eax, [ebp - 4]
	mov dword ebx, 2
	mov dword edx, 0
	div ebx
	mov [ebp - 4], eax
	;dump_regs 1

	;ensure gap is greater than 0; z > 0
	cmp dword [ebp - 4], 0
	jle near endsort
	;outmost forloop control finished

	;start of i for loop

	;assign the new value of i; i=gap;
	mov eax, [ebp - 4]
	mov [ebp - 8], eax

iloop:
	;check condition i < n
	mov eax, [ebp - 8]
	cmp dword [ebp + 12], eax
	jle endiloop
	
	;init j for this iteration
	mov eax, [ebp - 8]
	sub eax, [ebp - 4]
	mov [ebp - 12], eax
jloop:
	;check j>=0
	cmp dword [ebp - 12], 0
	jl endjloop
	
	mov eax, [ebp + 8] 
	mov ebx, [ebp - 12]
	lea ebx, [ebx * 4]
	add eax, ebx ;eax has address of A[j]
	mov ebx, [ebp - 4]
	lea ebx, [eax + 4 * ebx] ;ebx has address of A[j + gap]
	
	mov ecx, [eax] ;value of A[j]
	
	cmp dword ecx, [ebx]
	jle near endjloop
	
	;dump_regs 5

	push ecx ;value of A[j] on stack

	;A[j] = A[j + gap]
	mov ecx, [ebx]
	mov [eax], ecx

	pop ecx

	mov [ebx], ecx

	;perform j-=gap and jump to start of for loop
	mov eax, [ebp - 4]
	sub [ebp - 12], eax
	jmp jloop
	
endjloop:
	
	add dword [ebp - 8], 1
	jmp iloop

endiloop:


	jmp gaploop
endsort:
	;dump_regs 3
	leave 
	ret
