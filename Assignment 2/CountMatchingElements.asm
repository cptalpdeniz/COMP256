; COMP256 - Lab 8 - Assignment 2
; Question 5
; Counting Matching Elements

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

CountMatches PROTO, ptrArray1:PTR SDWORD, ptrArray2:PTR SDWORD, szArray:DWORD, diff:DWORD

.data
array1_x SDWORD 1,2,3,4,5,6,7,8
array1_y SDWORD 5,7,8,7,5,75,43,4
array2_x SDWORD 5,44,7,65,8,7,23,4
array2_y SDWORD 8,2,5,46,55,65,35,4
count DWORD ?,0
dif1 DWORD 11
dif2 DWORD 0

.code
main PROC           
    INVOKE CountMatches, ADDR array1_x, ADDR array1_y, LENGTHOF array1_x, dif1
    call WriteInt
    call Crlf

    INVOKE CountMatches, ADDR array2_x, ADDR array2_y, LENGTHOF array2_x, dif2
    call WriteInt
    call Crlf
exit
main ENDP

CountMatches PROC USES edx ebx edi esi ecx, ptrArray1:PTR SDWORD, ptrArray2:PTR SDWORD, szArray:DWORD, diff:DWORD
    mov esi,ptrArray1
    mov edi,ptrArray2
    mov ecx,szArray

L1:
    mov ebx,0
    mov ebx,[esi]
    mov edx,0
    mov edx,[edi]

.IF ebx > edx
        mov eax,ebx
        sub eax,edx
.ELSE
        mov eax,edx
        sub eax,ebx
.ENDIF

.IF (eax <= diff)
        inc count
.ENDIF

    add esi, SIZEOF SDWORD
    add edi, SIZEOF SDWORD
    loop L1

    mov eax,0
    mov eax,count
    mov count,0
    ret

CountMatches ENDP
END main