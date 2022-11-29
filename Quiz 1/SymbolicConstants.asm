COMMENT !
COMP256 - Lab 3 (Quiz 1)
Question 2
Alp Deniz Senyurt - 300203734
!

;TITLE Days off the week, Version 0.1		(SymbolicConstants.asm)

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

mon	TEXTEQU <"Monday">
tue TEXTEQU <"Tuesday">
wed TEXTEQU	<"Wednesday">
thr TEXTEQU <"Thursday">
fri TEXTEQU <"Friday">
sat TEXTEQU <"Saturday">
sun TEXTEQU <"Sunday">


.data
list BYTE mon,tue,wed,thr,fri,sat,sun
listSize = ($ - list)

.code
main PROC

COMMENT !
Was experimenting with printing array and its elements however was not able to print only 1 element.
	mov edx,OFFSET list
	call WriteString ;this prints the entire list
	mov esi,1
	mov edx,OFFSET (list[1])
	call WriteString
!
	call	DumpRegs			; display the registers

	invoke ExitProcess,0
main ENDP
end main