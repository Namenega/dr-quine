section .data
	; This is a comment outside the entry point
	fmt db "section .data%1$c	; This is a comment outside the entry point%1$c	fmt db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c	global main%1$c	extern printf%1$c%1$cfunc:%1$c	ret%1$c%1$cmain:%1$c	; This is a comment inside the entry point%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	call func%1$c%1$c	mov rdi, fmt%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c	mov rcx, fmt%1$c	mov rax, 0%1$c	call printf%1$c%1$c	mov rax, 0%1$c	pop rbp%1$c	ret%1$c", 0

section .text
	global main
	extern printf

func:
	ret

main:
	; This is a comment inside the entry point
	push rbp
	mov rbp, rsp

	call func

	mov rdi, fmt
	mov rsi, 10
	mov rdx, 34
	mov rcx, fmt
	mov rax, 0
	call printf

	mov rax, 0
	pop rbp
	ret
