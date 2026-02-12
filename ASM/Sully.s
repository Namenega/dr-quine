section .data
	fmt db "section .data%1$c	fmt db %2$c%3$s%2$c, 0%1$c	filename db %2$cSully_%%d.s%2$c, 0%1$c	cmd_compile db %2$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc -Wall -Wextra -Werror -no-pie Sully_%%1$d.o -o Sully_%%1$d%2$c, 0%1$c	cmd_run db %2$c./Sully_%%d%2$c, 0%1$c	sully_5 db %2$cSully_5.s%2$c, 0%1$c	mode db %2$cw%2$c, 0%1$c%1$csection .text%1$c	global main%1$c	extern fprintf%1$c	extern sprintf%1$c	extern fopen%1$c	extern fclose%1$c	extern system%1$c	extern access%1$c	extern exit%1$c%1$cmain:%1$c	push rbp%1$c	mov rbp, rsp%1$c	sub rsp, 256 ; buffer space%1$c%1$c	mov r12, %4$d ; int i%1$c%1$c	mov rdi, sully_5%1$c	mov rsi, 0 ; F_OK%1$c	call access%1$c	cmp rax, 0%1$c	jne .init%1$c	dec r12%1$c.init:%1$c	cmp r12, 0%1$c	jl .end%1$c%1$c	; sprintf(filename, ...)%1$c	lea rdi, [rbp-64]%1$c	mov rsi, filename%1$c	mov rdx, r12%1$c	call sprintf%1$c%1$c	; fopen(filename, w)%1$c	lea rdi, [rbp-64]%1$c	mov rsi, mode%1$c	call fopen%1$c	mov r13, rax ; FILE *f%1$c%1$c	cmp r13, 0%1$c	je .end%1$c%1$c	; fprintf(f, fmt, ...)%1$c	mov rdi, r13%1$c	mov rsi, fmt%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	mov r8, fmt%1$c	mov r9, r12%1$c	mov rax, 0%1$c	call fprintf%1$c%1$c	mov rdi, r13%1$c	call fclose%1$c%1$c	; sprintf(cmd, cmd_compile, i, i, i)%1$c	lea rdi, [rbp-256]%1$c	mov rsi, cmd_compile%1$c	mov rdx, r12%1$c	mov rcx, r12%1$c	mov r8, r12%1$c	call sprintf%1$c%1$c	; system(cmd)%1$c	lea rdi, [rbp-256]%1$c	call system%1$c%1$c	; sprintf(cmd, cmd_run, i)%1$c	lea rdi, [rbp-256]%1$c	mov rsi, cmd_run%1$c	mov rdx, r12%1$c	call sprintf%1$c%1$c	; system(cmd)%1$c	lea rdi, [rbp-256]%1$c	call system%1$c%1$c.end:%1$c	mov rax, 0%1$c	leave%1$c	ret%1$c", 0
	filename db "Sully_%d.s", 0
	cmd_compile db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc -Wall -Wextra -Werror -no-pie Sully_%1$d.o -o Sully_%1$d", 0
	cmd_run db "./Sully_%d", 0
	sully_5 db "Sully_5.s", 0
	mode db "w", 0

section .text
	global main
	extern fprintf
	extern sprintf
	extern fopen
	extern fclose
	extern system
	extern access
	extern exit

main:
	push rbp
	mov rbp, rsp
	sub rsp, 256 ; buffer space

	mov r12, 5 ; int i

	mov rdi, sully_5
	mov rsi, 0 ; F_OK
	call access
	cmp rax, 0
	jne .init
	dec r12
.init:
	cmp r12, 0
	jl .end

	; sprintf(filename, ...)
	lea rdi, [rbp-64]
	mov rsi, filename
	mov rdx, r12
	call sprintf

	; fopen(filename, w)
	lea rdi, [rbp-64]
	mov rsi, mode
	call fopen
	mov r13, rax ; FILE *f

	cmp r13, 0
	je .end

	; fprintf(f, fmt, ...)
	mov rdi, r13
	mov rsi, fmt
	mov rdx, 10
	mov rcx, 34
	mov r8, fmt
	mov r9, r12
	mov rax, 0
	call fprintf

	mov rdi, r13
	call fclose

	; sprintf(cmd, cmd_compile, i, i, i)
	lea rdi, [rbp-256]
	mov rsi, cmd_compile
	mov rdx, r12
	mov rcx, r12
	mov r8, r12
	call sprintf

	; system(cmd)
	lea rdi, [rbp-256]
	call system

	; sprintf(cmd, cmd_run, i)
	lea rdi, [rbp-256]
	mov rsi, cmd_run
	mov rdx, r12
	call sprintf

	; system(cmd)
	lea rdi, [rbp-256]
	call system

.end:
	mov rax, 0
	leave
	ret
