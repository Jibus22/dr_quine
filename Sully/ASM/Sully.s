%define _GNU_SOURCE
%define FLAG 1101o
%define MODE 644o
%define SYS_OPEN 2
section .data
current db __FILE__, 0
filename db "Sully_%1$d.s", 0
comp db "nasm -felf64 Sully_%1$d.s && clang -o Sully_%1$d Sully_%1$d.o && rm Sully_%1$d.o && ./Sully_%1$d", 0
msg db "%%define _GNU_SOURCE%2$c%%define FLAG 1101o%2$c%%define MODE 644o%2$c%%define SYS_OPEN 2%2$csection .data%2$ccurrent db __FILE__, 0%2$cfilename db %3$cSully_%%1$d.s%3$c, 0%2$ccomp db %3$cnasm -felf64 Sully_%%1$d.s && clang -o Sully_%%1$d Sully_%%1$d.o && rm Sully_%%1$d.o && ./Sully_%%1$d%3$c, 0%2$cmsg db %3$c%1$s%3$c%2$csection .text%2$cglobal main%2$cextern dprintf%2$cextern asprintf%2$cextern strlen%2$cextern system%2$cmain:%2$c;yadiyiyadyo%2$cpush rbp%2$cmov rbp, rsp%2$cmov r12, %4$d%2$ccmp r12, 0%2$cje exit%2$cmov rdi, current%2$ccall strlen%2$ccmp rax, 7%2$cjle getfilename%2$cdec r12%2$cgetfilename:%2$clea rdi, [r13]%2$cmov rsi, filename%2$cmov rdx, r12%2$ccall asprintf%2$cmov rdi, [r13]%2$cmov rsi, FLAG%2$cmov rdx, MODE%2$cmov rax, SYS_OPEN%2$csyscall%2$cmov rbx, rax%2$cmov rdi, rax%2$cmov rsi, msg%2$cmov rdx, msg%2$cmov rcx, 10%2$cmov r8, 34%2$cmov r9, r12%2$ccall dprintf%2$cmov rdi, rbx%2$cmov rax, 3%2$csyscall%2$clea rdi, [r13]%2$cmov rsi, comp%2$cmov rdx, r12%2$ccall asprintf%2$cmov rdi, [r13]%2$ccall system%2$cexit:%2$cmov rax, 0%2$cleave%2$cret%2$c"
section .text
global main
extern dprintf
extern asprintf
extern strlen
extern system
main:
;yadiyiyadyo
push rbp
mov rbp, rsp
sub rsp, 32
mov r8, 5
cmp r8, 0
je exit
mov rdi, current
call strlen
cmp rax, 7
jle getfilename
dec r8
getfilename:
lea rdi, [rsp]
mov rsi, filename
mov rdx, r8
call asprintf
mov rdi, [rsp]
mov rsi, FLAG
mov rdx, MODE
mov rax, SYS_OPEN
syscall
;push rax
;mov rdi, rax
;mov rsi, msg
;mov rdx, msg
;mov rcx, 10
;mov r8, 34
;mov r9, r10
;call dprintf
;pop rdi
;mov rax, 3
;syscall
;lea rdi, [r11]
;mov rsi, comp
;mov rdx, r10
;call asprintf
;mov rdi, [r11]
;call system
exit:
mov rax, 0
leave
ret
