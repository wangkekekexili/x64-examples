; Print hello to stdout 10 times.

%define SYS_EXIT 0x2000001
%define SYS_WRITE 0x2000004

%define STD_OUT 1

global start

section .data
hello db `hello\r\n`
hello_len equ $ - hello

section .text
start:
  mov r8, 0

loop:
  mov rax, SYS_WRITE
  mov rdi, STD_OUT
  mov rsi, hello
  mov rdx, hello_len
  syscall

  add r8, 1
  cmp r8, 10
  jl loop

  ; exit
  mov rax, SYS_EXIT
  mov rdi, 0
  syscall
