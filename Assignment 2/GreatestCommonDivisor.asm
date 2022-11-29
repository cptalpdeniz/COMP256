; COMP256 - Lab 8 - Assignment 2
; Question 4
; Greatest Common Divisor

ExitProcess proto

.code
main PROC
	mov rdx,0
	mov rax,5
	mov rbx,20
	push rax
	push rbx
	call GCD
	
	mov rdx,0
	mov rax,24
	mov rbx,18
	push rax
	push rbx
	call GCD

	mov rdx,0
	mov rax,11
	mov rbx,7
	push rax
	push rbx
	call GCD

	mov rdx,0
	mov rax,432
	mov rbx,226
	push rax
	push rbx
	call GCD
	
	mov rdx,0
	mov rax,26
	mov rbx,13
	push rax
	push rbx
	call GCD

	call ExitProcess
main ENDP

GCD PROC 
	enter 0,0
	mov rdx,0
	mov rax,[rbp+24]
	mov rbx,[rbp+16]

	DIV rbx
	cmp rdx,0
	jz Lable
	push rbx
	push rdx
	call GCD   

Lable:
	leave
	ret 8
GCD ENDP
END