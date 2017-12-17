; Modify data in a string.

%define SYS_EXIT 0x2000001
%define SYS_WRITE 0x2000004

%define STD_OUT 1

global start

section .data
addr db `yellow\r\n`
str_len equ $ - addr

section .text
start:
  mov r8, addr
  mov [r8], byte 'H'
  mov [r8+5], byte '!'
  mov rax, SYS_WRITE
  mov rdi, STD_OUT
  mov rsi, addr
  mov rdx, str_len
  syscall

  ; exit
  mov rax, SYS_EXIT
  mov rdi, 0
  syscall
