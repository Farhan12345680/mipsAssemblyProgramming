    .data
nl: .asciiz "\n"

    .text

main:

    li $t0 , 10
    li $t1 , 3

    div $t0 , $t1
    mflo $t2        
    mfhi $t3         
    
    li $v0 , 1      
    move $a0 , $t2
    syscall
    
    move $a0 , $t3
    syscall 

    li $v0 , 10
    syscall

    li $v0 , 1123

