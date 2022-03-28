.data
string:  .asciiz "Enter size : "
string_n:  .asciiz "Enter the number for array: "
ans: .asciiz "ans: "
.text
.globl main
main:
    li $v0,4        # print the string for input size
    la $a0,string
    syscall
    li $v0,5
    syscall
    move $t0,$v0
    sll $a0,$t0,2
    li $v0,9
    syscall
    move $t1,$v0
    addi $t2,$zero,0
    add $t3,$t1,$zero
while_input:
    bge $t2,$t0,end1
    li $v0,4
    la $a0,string_n     #print the string for taking numbers in array
    syscall
    li $v0,6
    syscall
    swc1 $f0,0($t3)
    addi $t3,$t3,4
    addi $t2,$t2,1
    j while_input
end1:
    addi $t4,$zero,0
    addi $t5,$zero,1
    addi $t6,$zero,0
    addi $t2,$zero,0
    mtc1 $zero, $f2
    add $t3,$t1,$zero
while_solve:
    bge $t2,$t0,end2
    l.s $f4,0($t3)
    beq $t6,$t4,if      # if t6 is 0 then add
    beq $t6,$t5,else    # else subtract
if:
    add.s $f2,$f2,$f4
    addi $t6,$zero,1
    j exit1
else:
    sub.s $f2,$f2,$f4
    addi $t6,$zero,0
exit1:
    addi $t3,$t3,4
    addi $t2,$t2,1
    j while_solve
end2:
    li $v0,4
    la $a0,ans      # to print the final answer
    syscall
    li $v0, 2
    mov.s $f12, $f2  
    syscall
    li $v0,10
    syscall
