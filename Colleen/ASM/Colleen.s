section .data
msg db "section .data%2$cmsg db %3$c%1$s%3$c%2$csection .text%2$cglobal main%2$cextern printf%2$c;comment outside fn%2$cmain:%2$c;comment into fn%2$cpush rbp%2$cmov rbp, rsp%2$ccall fn%2$cmov rdi, msg%2$cmov rsi, msg%2$cmov rdx, 10%2$cmov rcx, 34%2$ccall printf%2$cmov rax, 0%2$cleave%2$cret%2$c%2$cfn:%2$cxor rcx,rcx%2$cret%2$c"
section .text
global main
extern printf
;comment outside fn
main:
;comment into fn
push rbp
mov rbp, rsp
call fn
mov rdi, msg
mov rsi, msg
mov rdx, 10
mov rcx, 34
call printf
mov rax, 0
leave
ret

fn:
xor rcx,rcx
ret
