COMMENT !
COMP256 - Lab 4 (Assignment 1)
Question 5
!

;TITLE Array Reversing in 32-bit environment, Version 0.1		(ArrayWrapping.asm)

.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:dword

.data
arrayA DWORD 1001d,1002d,1003d,1004d,1005d
len DWORD 5

.code
main proc
	mov	esi, OFFSET arrayA
	mov edi, OFFSET arrayA
	add edi,16

L1:
	mov eax, [esi]
	mov ebx, [edi]
	mov [edi], eax
	mov [esi], ebx
	add esi, 4
	sub edi, 4
	cmp esi, edi
	jl L1

	invoke ExitProcess,0
main endp
end main
