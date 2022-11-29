COMMENT !
COMP256 - Lab 3 (Quiz 1)
Question 3
Alp Deniz Senyurt - 300203734
!

;TITLE Data Types, Version 0.1		(DataTypes.asm)

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4092
ExitProcess proto,dwExitCode:dword


.data
ubyte_t BYTE 128
sbyte_t SBYTE -128
uword_t WORD 63245
word_t SWORD -31715
dword_t DWORD 4164568961
udword_t SDWORD -2045687564
fword_t FWORD 271456356985256
qword_t QWORD 17446236589674552365
tbyte_t TBYTE 00FFFFFFFFFFFFFFFFh ;technically this is the correct for this data type (according to the book) however when I add this value to watch, it comes up as "long double" and shows -nan. Even if I turn the last 2 digits to 00, still shows nan.
real4_t REAL4 -1.8
real8_t REAL8 2.8E-247
real10_t REAL10 4.2E4025

.code
main PROC

	mov eax, dword_t
	mov ebx, real4_t
	call	DumpRegs			; display the registers

	invoke ExitProcess,0
main ENDP
end main