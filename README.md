# dr-quine

A quine is a computer program (a kind of metaprogram) whose output and source code are identical. As a challenge or for fun, some programmers try to write the shortest quine in a given language programming.

The operation that consists of simply opening the source file and displaying it is considered cheating. More generally, a program that uses any data entry cannot be considered a valid quine. A trivial solution is a program whose source code is empty. Indeed, the execution of such a program produces for most languages no output; that is to say, the source code of the program.

This project confronts you to the principle of self-reproduction and the problems that derive from it. It is a perfect introduction to more complex projects, particularly (self-reproducing) malware projects.

## Project restrictions from 42 subject

- Both the **C** and the **Assembly** implementations are required for all mandatory programs. Your repository must contain two top-level folders named **C** and **ASM**.
- Each folder must contain its own Makefile with the usual rules.
- Your Makefile must compile the project and must contain the usual rules. It must recompile and re-link the program only if necessary.

#### ASM

- Expected Assembly architecture: `x86-64` running on `Linux`.
- ex: `nasm -f elf64 Colleen.s -o Colleen.o && gcc Colleen.o -o Colleen`

## Programs

Recode three different programs, each with different properties. Each program will have to be coded in **C** and in **Assembly**, placed respectively in folders named **C** and **ASM**, each folder containing its own Makefile with the usual rules.

#### Colleen

- The executable must be named `Colleen`.
- When executed, the program must display on the standard output an output identical to the source code of the file used to compile the program.
- The C source code must contain at least:
	- A main function.
	- Two different comments.
	- One of the comments must be present in the main function.
	- One of the comments must be present outside of your program.
	- Another function in addition to the main function (which of course will be called).
- The Assembly source code must contain at least:
	- A clear entry point (e.g., _start or a symbol linked to main as per your toolchain).
	- Two different comments.
	- One comment must be present within the entry point or its immediately-called routine.
	- One comment must be present outside of the entry point routine.
	- One additional routine/function called from the entry point.

#### Grace

- The executable must be named `Grace`.
- When executed, the program writes in a file named Grace_kid.c / Grace_kid.s the source code of the file used to compile the program.
- The C source code must strictly contain:
	- No main declared (no functions declared at all).
	- Exactly three #define.
	- One comment.
- The program will run by calling a macro.
- The Assembly source code must strictly contain:
	- No extra routines beyond the entry point needed to perform the task (no additional procedures).
	- Exactly three macros (or the closest equivalent for your assembler).
	- One comment.

#### Sully

- The executable must be named `Sully`.
- When executed the program writes in a file named `Sully_X.c` / `Sully_X.s`. The X will be an integer given in the source. Once the file is created, the program compiles this file and then runs the new program (which will have the name of its source file).
- Stopping the program depends on the file name: the resulting program will be executed only if the integer X is greater or equals than 0.
- An integer is therefore present in the source of your program and will have to evolve by decrementing every time you create a source file from the execution of the program.
- You have no constraints on the source code, apart from the integer that will be set to 5 at first.

## Explanation

#### C

#### ASM

- `section .data` - The `.data` section will exist within the **data** segment and contain data such as initialized **global variables**.
- `section .text` - Code section that contains program code instructions.

- `rbp` - stack base pointer (`r` is for x64)
- `rsp` - stack pointer
- `rdi` - destination index
- `rsi` - source index
- `rcx` - loop counter
- `rax` - return value

- `fmt` - A label – a symbolic name that the assembler (and later the linker) can use to refer to the address of the bytes that follow.

- `printf` is a variadic function (accepts variable arguments). The ABI specifies:
  - First 6 arguments: Passed in registers %rdi, %rsi, %rdx, %rcx, %r8, %r9 (in order).
  - 7th+ arguments: Pushed onto the stack (in reverse order, like C).
  - ex: For printf("Hello, %s! You have %d messages\n", name, count):
    - %rdi = format string ("Hello, %s! You have %d messages\n").
    - %rsi = name (second argument).
    - %rdx = count (third argument).
  - Check CUTTER -> Decompiler to understand printf
   








