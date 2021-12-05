prog				SEGMENT
pr					PROC				FAR
ASSUME				CS:prog,DS:prog,ES:prog

MOV					AX,0
PUSH				ds ax
MOV					AX,prog
MOV					DS,AX
MOV					ES,AX

JMP					start

M1			DB		10,13,"Word: $"
C1			DB		10,13,"Is palindrome. $"
C2			DB		10,13,"Not palindrome. $"
Dizi		DB		100 DUP('$')
sayac		DB		0

start:

MOV					ah,09h
LEA					DX,M1
INT					21h

MOV					DI,Offset Dizi

l1:

MOV					ah,01h
INT					21h

CMP					al,13
JE					l1e

INC					sayac
STOSB				

JMP					l1

l1e:

MOV					SI,Offset Dizi
MOV					AX,Offset Dizi
ADD					Al,sayac
MOV					DI,AX

l2:

CMP					DI,SI
JLE					l2e

CMPSB
JNE					farkli

SUB					DI,2

JMP					l2

l2e:

MOV					ah,09h
LEA					DX,C1
INT					21h

JMP					en

farkli:

MOV					ah,09h
LEA					DX,C2
INT					21h

en:
					RET

pr					ENDP
prog				ENDS
					END