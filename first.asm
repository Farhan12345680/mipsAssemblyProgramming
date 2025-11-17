    .data
prompt: .asciiz "Write an integer into the command prompt\n"
response: .asciiz "Write the integer here: "
answer: .asciiz "This is the final answer -> "
newline: .asciiz "\n"
    .text
    
main:
    li $v0 ,4
    la $a0 ,prompt
    syscall
    
    la $a0 , response
    syscall

    li $v0 , 5
    syscall

    move $t0, $v0

    li $v0 , 4
    la $a0 ,newline
    syscall

    la $a0 , answer
    syscall

    li $v0 , 1
    move $a0 , $t0
    syscall

    li $v0 , 4
    la $a0 ,newline
    syscall


    li $v0, 10
    syscall