.data
	buffer: .space 20
	str1: .asciiz "\nEscreva a string (max: 20 caracteres): "
	str2: .asciiz "\nNova string: "
	str3: .asciiz "\nDigite um caracter: "
	detec: .byte '\0'

.text
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 8
	la $a0, buffer
	li $a1, 20
	move $s0, $a0
	syscall
	
	li $v0, 4
	la $a0, str3
	syscall
	
	li $v0, 12
	syscall
	addi $s1, $v0, 0
	
	li $v0, 4
	la $a0, str3
	syscall
	
	li $v0, 12
	syscall
	addi $s2, $v0, 0
	
	
	lb $s3, detec
	add $t1, $0, $s0
	LOOP: 
	lb $t0, 0($t1)
	beq $t0, $s3, exit
		bne $t0, $s1, cont
			sb $s2, 0($t1)
		cont:
		addi $t1, $t1, 1
		j LOOP
	exit:
	
	li $v0, 4
	la $a0, str2
	syscall
	
	li $v0, 4
	add $a0, $0, $s0
	syscall
	
