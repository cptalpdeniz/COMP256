; COMP256 - Lab 6 
; Question 3

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
    minArr BYTE 5,2,4,1,3
    maxArr BYTE 9,5,8,4,6
    pinArr BYTE 6,3,4,3,4
    pinArr2 BYTE 5,4,6,2,5
    pinArr3 BYTE 6,2,6,2,5
    pinArr4 BYTE 7,3,7,3,2
    val1 BYTE ?
    val2 BYTE ?
    num  BYTE ?
    str1 BYTE "Valid",0
    str2 BYTE "Invalid",0

.code
Validate_PIN PROC, arr:ptr BYTE
mov eax, 0
mov ebx, 0
mov edx, 0
mov ecx, 5

L1:
    mov al, [minArr+ecx-1]
    mov esi, arr
    mov dl, [esi+ecx-1]
    mov num, dl
    mov bl, [maxArr+ecx-1]

    .IF(num < al) || (num > bl)
    mov edx, OFFSET str2
    mov eax, 0
    mov eax, ecx
    ret
    .ENDIF

    loop L1

    mov edx, OFFSET str1
    mov eax, 0

ret
Validate_PIN ENDP


main PROC
    invoke Validate_PIN, addr pinArr
    call WriteString
    call WriteInt
    call Crlf

    invoke Validate_PIN, addr pinArr2
    call WriteString
    call WriteInt
    call Crlf

    invoke Validate_PIN, addr pinArr3
    call WriteString
    call WriteInt
    call Crlf

    invoke Validate_PIN, addr pinArr4
    call WriteString
    call WriteInt
    call Crlf

main ENDP
END main