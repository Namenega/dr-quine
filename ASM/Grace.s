section .data
	; This is the only comment in Grace.s
	filename db "Grace_kid.s", 0
	fmt db "section .data%1$c	; This is the only comment in Grace.s%1$c	filename db %2$cGrace_kid.s%2$c, 0%1$c	fmt db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c	global main%1$c	extern dprintf%1$c	extern open%1$c	extern close%1$c	extern exit%1$c%1$c%%macro M_OPEN 1%1$c	mov rdi, %1 %1$c	mov rsi, 577%1$c	mov rdx, 420%1$c	call open%1$c%%endmacro%1$c%1$c%%macro M_WRITE 3%1$c	mov rdi, %1 %1$c	mov rsi, %2 %1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	mov r8, %3 %1$c	mov rax, 0%1$c	call dprintf%1$c%%endmacro%1$c%1$c%%macro M_EXIT 0%1$c	mov rdi, 0%1$c	call exit%1$c%%endmacro%1$c%1$cmain:%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	M_OPEN filename%1$c	mov r12, rax%1$c%1$c	M_WRITE r12, fmt, fmt%1$c%1$c	mov rdi, r12%1$c	call close%1$c%1$c	M_EXIT%1$c	pop rbp%1$c	ret%1$c", 0

section .text
	global main
	extern dprintf
	extern open
	extern close
	extern exit

%macro M_OPEN 1
	mov rdi, %1 
	mov rsi, 577
	mov rdx, 420
	call open
%endmacro

%macro M_WRITE 3
	mov rdi, %1 
	mov rsi, %2 
	mov rdx, 10
	mov rcx, 34
	mov r8, %3 
	mov rax, 0
	call dprintf
%endmacro

%macro M_EXIT 0
	mov rdi, 0
	call exit
%endmacro

main:
	push rbp
	mov rbp, rsp

	M_OPEN filename
	mov r12, rax

	M_WRITE r12, fmt, fmt

	mov rdi, r12
	call close

	M_EXIT
	pop rbp
	ret
