COMMENT !
COMP256 - Lab 3 (Quiz 1)
Question 4
Alp Deniz Senyurt - 300203734
!

;TITLE Add Variables 32-bit to 64-bit conversion, Version 0.1		(AddVariables64.asm)
; AddVariables.asm - Chapter 3 example.

COMMENT !
; This part off the program is not needed as this is applicable to 32-bit applications only
.386
.model flat,stdcall
.stack 4096
!

COMMENT !
; There are no parameters for statements using PROTO
ExitProcess PROTO,dwExitCode:dword
!

ExitProcess PROTO

; All DWORD types have been updated to QWORD as register and data-type needs to match
.data
firstval  qword 20002000h
secondval qword 11111111h
thirdval  qword 22222222h
sum qword 0

.code
main proc
COMMENT !
; All 32-bit registers are updated to 64-bit versions
	mov	eax,firstval				
	add	eax,secondval		
	add eax,thirdval
	mov sum,eax
!

	mov	rax,firstval				
	add	rax,secondval		
	add rax,thirdval
	mov sum,rax

	; invoke ExitProcess,0 // This line has been commented out as 64-bit version of MASM does not support INVOKE directive.
main endp

;END main has been changed to END only as 64-bit END directive doesn't need to specify program entry point
END