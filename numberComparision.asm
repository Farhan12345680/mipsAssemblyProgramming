  .data

nl: .asciiz "\n "
isEqual: .asciiz "the numbers are equal\n"
isGreater: .asciiz "the first number is greater\n"
isLesser: .asciiz "the second number is lesser\n"
prompt: .asciiz "Enter two numbers\n"
firstNum: .asciiz "Enter the first number: "
secondNum: .asciiz "Enter the second number: "  


    .text

main:

    j inputTakingLabel 




inputTakingLabel:
    li $v0 , 4
    la $a0 , prompt
    syscall

    li $v0 , 4
    la $a0 ,firstNum
    syscall

    li $v0 ,5
    syscall
    move $t0 , $v0
    
    li $v0 , 4
    la $a0 ,secondNum
    syscall

    li $v0 ,5
    syscall
    move $t1 , $v0

    j compare


compare:
    beq $t0 , $t1 , Equal
    bgt $t0 , $t1 , Greater
    blt $t0 , $t1 , Lesser

Equal:

    li $v0 , 4
    la $a0 , isEqual
    syscall
    j END

Lesser:

    li $v0 , 4
    la $a0 , isLesser
    syscall
    j END

Greater:
    li $v0 , 4
    la $a0 , isGreater
    syscall
    j END

END:
    li $v0 , 10
    syscall