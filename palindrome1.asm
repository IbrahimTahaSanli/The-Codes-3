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

DEC					sayac

MOV					SI,Offset Dizi

MOV					cl,sayac
MOV					ch,0


l2:

LODSB				
MOV					bl,al

ADD					SI,cx

LODSB		

CMP					al,bl
JNE					farkli

SUB					SI,cx

INC					SI

DEC					cl

LOOP				l2

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