; Allocate a string on the stack.

%define SYS_EXIT 0x2000001
%define SYS_WRITE 0x2000004

%define STD_OUT 1

global start

section .data
dummy db 'dummy'

section .text
start:
  sub rsp, 4
  mov [rsp], byte 'H'
  mov [rsp+1], byte 'e'
  mov [rsp+2], byte 'y'
  mov [rsp+3], byte '!'

  mov rax, SYS_WRITE
  mov rdi, 0
  mov rsi, rsp
  mov rdx, 4
  syscall

  ; exit
  mov rax, SYS_EXIT
  mov rdi, 0
  syscall
