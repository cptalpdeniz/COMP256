; COMP256 - Lab 7
; Question 1
; Encryption Using Rotate Operations

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096

.data
key BYTE -2,4,1,0,-3,5,2,-4,-4,6
keySize = $ - key
testText1 BYTE "First text",0
testText2 BYTE "Second text",0

.code
main PROC
	call Clrscr
	mov edx,OFFSET testText1
	call WriteString
	call CrLf
	mov esi,OFFSET testText1

L1: 
	mov ecx,keySize
	mov edi,OFFSET key
	call Encryption
	jnz L1

	mov edx,OFFSET testText1
	call WriteString
	call CrLf
	call CrLf

	mov edx,OFFSET testText2
	call WriteString
	call CrLf
	mov esi,OFFSET testText2

L2: 
	mov ecx,keySize
	mov edi,OFFSET key
	call Encryption
	jnz L2

	mov edx,OFFSET testText2
	call WriteString
	call CrLf
	exit
main ENDP

Encryption PROC
L1: 
	push ecx
	cmp BYTE PTR[esi],0
	je L4

	mov cl,[edi]
	cmp cl,0
	jge L2
	rol BYTE PTR[esi],cl
	jmp L3

L2: 
	ror BYTE PTR[esi],cl

L3: 
	inc esi
	inc edi
	pop ecx
	loop L1
	 
	or eax,1
	jmp L5

L4: 
	pop ecx

L5: 
	ret
Encryption ENDP
END main
