COMMENT !
COMP256 - Lab 4 (Assignment 1)
Question 6
!

;TITLE Array wrapping in 32-bit environment, Version 0.1		(ArrayWrapping.asm)

.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO,dwExitCode:dword

.data
arrayA DWORD 1001d,1002d,1003d,1004d,1005d
len DWORD 5

.code
main proc
	
	mov ebx, OFFSET arrayA
	mov edx,len
	cmp edx,1
	je lengthOne
	
	cmp edx,2
	je lengthTwo

	cmp edx,3
	jge lengthGreater

lengthOne:
	invoke ExitProcess,0

lengthTwo:
	mov eax, [ebx + 4]
	mov cx, [ebx]
	mov [ebx + 4], cx
	mov [ebx], eax
	invoke ExitProcess,0

lengthGreater:
	mov edx, [ebx + 16]						;last element in the array, put in temp location
	push edx
	mov ecx, 16										
start:
    mov eax, [ebx + ecx]
    cmp eax, [ebx]
    je firstIndex

    mov edx, [ebx + ecx - 4]
    mov [arrayA + ecx], edx
    sub ecx, 3
    loop start

firstIndex:
    pop edx
    mov [arrayA + ecx],edx
    invoke ExitProcess,0

main endp
end main
