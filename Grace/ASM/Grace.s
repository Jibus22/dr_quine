%define FLAG 1101o
%define MODE 644o
%define SYS_OPEN 2
section .data
filename db "Grace_kid.s", 0
msg db "%4$cdefine FLAG 1101o%2$c%4$cdefine MODE 644o%2$c%4$cdefine SYS_OPEN 2%2$csection .data%2$cfilename db %3$cGrace_kid.s%3$c, 0%2$cmsg db %3$c%1$s%3$c%2$c%4$cmacro my_main 0%2$csection .text%2$cglobal main%2$cextern dprintf%2$cmain:%2$c;yadiyiyadyo%2$cpush rbp%2$cmov rbp, rsp%2$cmov rdi, filename%2$cmov rsi, FLAG%2$cmov rdx, MODE%2$cmov rax, SYS_OPEN%2$csyscall%2$cmov rbx, rax%2$cmov rdi, rax%2$cmov rsi, msg%2$cmov rdx, msg%2$cmov rcx, 10%2$cmov r8, 34%2$cmov r9, 37%2$ccall dprintf%2$cmov rdi, rbx%2$cmov rax, 3%2$csyscall%2$cmov rax, 0%2$cleave%2$cret%2$c%4$cendmacro%2$cmy_main%2$c"
%macro my_main 0
section .text
global main
extern dprintf
main:
;yadiyiyadyo
push rbp
mov rbp, rsp
mov rdi, filename
mov rsi, FLAG
mov rdx, MODE
mov rax, SYS_OPEN
syscall
mov rbx, rax
mov rdi, rax
mov rsi, msg
mov rdx, msg
mov rcx, 10
mov r8, 34
mov r9, 37
call dprintf
mov rdi, rbx
mov rax, 3
syscall
mov rax, 0
leave
ret
%endmacro
my_main
