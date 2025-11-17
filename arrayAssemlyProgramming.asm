    .data

newline: .asciiz "\n"
sizePromt: .asciiz "Write how many numbers you want in your array\n"
numberPromt: .asciiz "give me a array number here: "
thisAreAllTheArrayElements: .asciiz "\n\nThese are all the array Elements\n"



    .text
main:
    li $s1 , 4
    li $v0 , 4
    la $a0 , sizePromt
    syscall


takeArraySizeInput:
    li $v0 , 5
    syscall

    move $t6 , $v0   

    mult $t6 , $s1
    mflo $t7

    li $v0 , 9
    move $a0 , $t7
    syscall
    
    move $t1 , $v0
    li $t2 , 0




    j  printArrayElementInput

printArrayElementInput:

    li $v0 , 4
    la $a0 , numberPromt
    syscall

    li $v0 , 5
    syscall

    move $s0 , $v0

    mult $t2 , $s1
    mflo $t5
    add $t5 , $t5 , $t1

    sw $v0 , 0($t5)
    addi $t2 , $t2 ,1

    beq $t2 , $t6 ,print1
    j printArrayElementInput

print1:
    li $v0 , 4
    la $a0 , thisAreAllTheArrayElements
    syscall
    li $t2 , 0

    j printArray

printArray:

    li $v0 , 1
    mult $t2 , $s1
    mflo $t5
    add $t5 , $t5 , $t1

    lw $a0 , 0($t5)
    addi $t2 , $t2 ,1
    syscall

    la $a0 , newline
    li $v0 , 4
    syscall

    beq $t2 , $t6 , END
    j printArray

END:
    li $v0 , 10
    syscall