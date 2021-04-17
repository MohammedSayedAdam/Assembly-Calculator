INCLUDE Irvine32.inc

.data
x DWORD ?
y DWORD ?
res DWORD ?
sum DWORD 0
msg6 Byte "CHOICE: ", 0
endedmsg Byte"The Program is Ended",0
msg Byte "        Calculater          ", 0
msg1 Byte "Press 'A' For ADDITION", 0
msg2 Byte "Press 'S' For SUBTRACTION", 0
msg3 Byte "Press 'M' For MULTIPLICATION", 0
msg4 Byte "Press 'D' For DIVISION", 0
msg5 Byte "****************************", 0
msg7 Byte "These Char only acceptable ['a','A','S','s','M','m','D','d']", 0
msg8 Byte "Result Is: ", 0
inp1 Byte "First Number : ", 0
inp2 Byte "Second Number : ", 0
caption Byte "Programm is Ended",0
question BYTE "         The Application is ending" 
BYTE 0dh,0ah
BYTE "Would you like to Continiue Again with My Calc ? ",0 
 
.code
Display proc
	mov edx,offset msg
	mov eax, (yellow *16) + black
	call SetTextColor
	call writestring
	call crlf
	mov edx,offset msg1
	call writestring
	call crlf
	mov edx,offset msg2
	call writestring
	call crlf
	mov edx,offset msg3
	call writestring
	call crlf
	mov edx,offset msg4
	call writestring
	call crlf                         
	mov edx,offset msg5
	call writestring
	call crlf
	mov edx,offset msg6
	call writestring
 ret
Display ENDP


Compare proc
	cmp al, 'a' 
	je addition
	cmp  al, 'A'
	je addition
	cmp al, 's'
	je subtraction
	cmp  al, 'S'
	je subtraction
	cmp al, 'M'
	je multiplication
	cmp  al, 'm'
	je multiplication
	cmp al, 'D'
	je division
	cmp  al, 'd'
	je division
	jmp nooon
addition:
	call crlf
	call ReadTwoInt
	mov eax,x 
	add eax,y 
	mov edx,OFFSET msg8
	call writestring
	call writedec
	jmp done
subtraction:
	call crlf
	call ReadTwoInt
	mov eax,x
	sub eax,y
	mov edx,OFFSET msg8
	call writestring
	call writeint
	jmp done
multiplication:
	call crlf
	call ReadTwoInt
	mov eax, x
	imul eax, y
	mov edx,OFFSET msg8
	call writestring
	call writedec
	jmp done
division:
	call crlf
	call ReadTwoInt
	mov edx, 0
	mov eax, x
	mov ebx, y
	div ebx
	mov edx,OFFSET msg8
	call writestring
	call writedec
	jmp done
nooon:
 call Clrscr
 mov edx,offset msg7
 call writestring
done:
    call crlf
	mov ebx,OFFSET caption 
	mov edx,OFFSET question 
	call MsgBoxAsk
	call crlf
ret
Compare ENDP

ReadTwoInt proc
	mov edx,offset inp1
	call writestring
    call ReadInt
	call crlf
	mov x,eax
	mov edx,offset inp2
	call writestring
	call ReadInt
	call crlf
	mov y,eax
ret
ReadTwoInt ENDP
main proc
 Yes:	
	call Clrscr
	call Display
	call ReadChar 
	call writechar
	call Compare
	cmp eax,6
	je Yes
	call Clrscr
	mov edx,offset endedmsg
	mov eax, (white *16) + black
	call SetTextColor
	call writestring
	call crlf
	call WaitMsg
invoke ExitProcess, 0
main endp
end main



