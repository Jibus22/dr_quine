%define _GNU_SOURCE
%define FLAG 1101o
%define MODE 644o
%define SYS_OPEN 2
section .data
current db __FILE__, 0
filename db "Sully_%1$d.s", 0
comp db "nasm -felf64 Sully_%1$d.s && clang -o Sully_%1$d Sully_%1$d.o && rm Sully_%1$d.o && ./Sully_%1$d", 0
msg db "%%define _GNU_SOURCE%2$c%%define FLAG 1101o%2$c%%define MODE 644o%2$c%%define SYS_OPEN 2%2$csection .data%2$ccurrent db __FILE__, 0%2$cfilename db %3$cSully_%%1$d.s%3$c, 0%2$ccomp db %3$cnasm -felf64 Sully_%%1$d.s && clang -o Sully_%%1$d Sully_%%1$d.o && rm Sully_%%1$d.o && ./Sully_%%1$d%3$c, 0%2$cmsg db %3$c%1$s%3$c%2$csection .text%2$cglobal main%2$cextern dprintf%2$cextern asprintf%2$cextern strlen%2$cextern system%2$cextern free%2$cmain:%2$c;yadiyiyadyo%2$cpush rbp%2$cmov rbp, rsp%2$csub rsp, 32%2$cpush r12%2$cpush r13%2$cmov r12, %4$d%2$ccmp r12, 0%2$cjle exit%2$cmov rdi, current%2$ccall strlen%2$ccmp rax, 7%2$cjle getfilename%2$cdec r12%2$cgetfilename:%2$clea rdi, [rsp]%2$cmov rsi, filename%2$cmov rdx, r12%2$ccall asprintf%2$cmov rdi, [rsp]%2$cmov rsi, FLAG%2$cmov rdx, MODE%2$cmov rax, SYS_OPEN%2$csyscall%2$cpush rax%2$cpush r12%2$cmov rdi, rax%2$cmov rsi, msg%2$cmov rdx, msg%2$cmov rcx, 10%2$cmov r9, r12%2$cmov r8, 34%2$ccall dprintf%2$cpop r12%2$cpop rdi%2$cmov rax, 3%2$csyscall%2$cmov rdi, [rsp]%2$ccall free%2$clea rdi, [rsp]%2$cmov rsi, comp%2$cmov rdx, r12%2$ccall asprintf%2$cmov rdi, [rsp]%2$ccall system%2$cmov rdi, [rsp]%2$ccall free%2$cexit:%2$cpop r13%2$cpop r12%2$cmov rax, 0%2$cleave%2$cret%2$c"
section .text
global main
extern dprintf
extern asprintf
extern strlen
extern system
extern free
main:
;yadiyiyadyo
push rbp
mov rbp, rsp
sub rsp, 32
push r12
push r13
mov r12, 5
cmp r12, 0
jle exit
mov rdi, current
call strlen
cmp rax, 7
jle getfilename
dec r12
getfilename:
lea rdi, [rsp]
mov rsi, filename
mov rdx, r12
call asprintf
mov rdi, [rsp]
mov rsi, FLAG
mov rdx, MODE
mov rax, SYS_OPEN
syscall
push rax
push r12
mov rdi, rax
mov rsi, msg
mov rdx, msg
mov rcx, 10
mov r9, r12
mov r8, 34
call dprintf
pop r12
pop rdi
mov rax, 3
syscall
mov rdi, [rsp]
call free
lea rdi, [rsp]
mov rsi, comp
mov rdx, r12
call asprintf
mov rdi, [rsp]
call system
mov rdi, [rsp]
call free
exit:
pop r13
pop r12
mov rax, 0
leave
ret
