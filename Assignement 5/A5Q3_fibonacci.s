##################################################################
#Used the below C code written by me as reference:
#// C program to print fibonacci series till 500
# #include<stdio.h>
#
#int main(){
#    int a = 0;
#    int b = 1;
#    int c = a + b;
#    printf("%d %d ", a, b);
#    while(c <= 500) {
#        printf("%d ", c);
#        //c = a + b;
#        a = b;
#        b = c;
#        c = a + b;
#    }
#    return 0;
#}
##################################################################


.data
    newline: .asciiz "\n"
    strPrompt: .asciiz "*The next fibonacci number "
    strPrompt2: .asciiz " is greater than 500*"
    newlinefibo: .asciiz "\nF"
    equals: .asciiz " = "
    fibo: .asciiz "F"
.text
.globl main
main:
    li $s0, 0       #s0 denotes a in C code
    li $s1, 1       #s1 denotes b in C code
    li $s3, 0       #s3 maintains count of fibonacci nos       
    add $s2, $s0, $s1   #s2 denotes c in C code
    move $a0, $s0
    move $a1, $s3
    jal print_fibonacci     #function call to print the fibonacci no
    addi $s3, $s3, 1
    move $a0, $s1
    move $a1, $s3
    jal print_fibonacci     #function call to print the fibonacci no
    addi $s3, $s3, 1

loop:
    li $t0, 500
    slt $t1, $t0, $s2      #checks if c <= 500
    bne $t1, $zero, exit
    move $a0, $s2
    move $a1, $s3
    jal print_fibonacci
    addi $s3, $s3, 1
    move $s0, $s1       #denotes a=b in C code
    move $s1, $s2       #denotes b=c in C code
    add $s2, $s1, $s0   #denotes c=a+b in C code
    j loop

exit:
    li $v0, 4
    la $a0, strPrompt
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    li $v0, 4
    la $a0, strPrompt2
    syscall                 # the above lines in exit show the prompt that
    li $v0, 10              # the next fibonacci no is greater than 500
    syscall                 

print_fibonacci:
    move $t0, $a1   #count of fibonacci no
    move $t1, $a0   #actual fibonacci no
    li $v0, 4
    la $a0, fibo
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, equals
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    jr $ra

