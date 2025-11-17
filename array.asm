    .data
array: .word 10, 20, 30, 40, 50



    .text
main:
    li $t2 , 0
    j printLoop




printLoop:
    li $t7 ,4
    li $v0 , 1
    mult $t2 , $t7
    mflo $t3
    lw $a0 , array($t3)
    syscall 
    addi $t2 , $t2 , 1   
    beq $t2 , 5 , endLoop
    j printLoop

endLoop:
    li $v0 , 10
    syscall