section .data
	program db "#include <stdio.h>%cvoid printSelf() {%c	char *program = %c%s%c;%c    printf(program, 10, 10, 34, program, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c/* This is a comment outside the main function */%cint main() {%c    /* This is a comment inside the main function */%c    printSelf();%c    xor eax, eax ; Return 0 %c}"

	n1 db 10		; db = define byte -- storing constants
	quote db 34

section .text
	global _start

_start:
	; printSelf()
	lea eax, [program]	; loads the address of 'program'into eax -- Load Effective Address
	push eax			; push the address store in eax onto the stack -- can be used as an argument when calling printSelf()
	call printSelf

	; Exit the program
	mov eax, 60			; syscall number for exit
	xor edi, edi		; exit code 0 -- clear the edi register that is used to pass an argument to the 'exit' syscall -- clear so 0
	syscall				; trigger the syscall - here 'exit'

printSelf:
	; Write the program string
	mov eax, 4			; syscall number for write -- 4 = write
	mov edi, 1			; file descriptor 1 (stdout)
	lea edx, [program]
	int 0x80			; trigger a syscall (write on standard output)

	; Return
	ret
