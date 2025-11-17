    .data
one: .asciiz "this is hello world in assembly "

    .text

main :
    li $v0 ,4
    la $a0 ,one
    syscall

    li $v0, 10
    syscall