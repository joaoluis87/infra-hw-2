.data
	x: .word
	y: .word
	msg: .asciiz "N invalido\n" 
	saidax: .asciiz "\nArray x:\n"
	saiday: .asciiz "\nArray y:\n"
	linha: .byte '\n'
.text
inicio:
	addi $v0, $0,  5
	syscall
	slti $t0, $v0, 6
	beq $t0, $0, cont
		addi $v0, $0, 4
		la $a0, msg
		syscall
	j inicio
	
	cont:
	move $s0, $v0
	
	subi $s1, $s0, 5
	
	mul $s0, $s0, 4
	mul $s1, $s1, 4
	
	addi $v0, $0, 9
	add $a0, $0, $s0
	syscall
	add $s2, $0, $v0
	
	addi $v0, $0, 9
	add $a0, $0, $s1
	syscall
	add $s3, $0, $v0
	
	addi $t0, $0, 0

	loop0:
	beq $t0, $s0, saida0
		addi $v0, $0, 5
		syscall
		add $t1, $t0, $s2
		sw $v0, 0($t1)
		addi $t0, $t0, 4
		j loop0
	saida0:
	
	addi $t0, $0, 0
	
	loop1:
	beq $t0, $s1, saida1
		add $t1, $0, $t0
		addi $t4, $t1, 24
		add $t3, $0, $0
		loop2:
		beq $t1, $t4, saida2
			add $t5, $t1, $s2
			lw $t2, 0($t5)
			add $t3, $t3, $t2
			addi $t1, $t1, 4
			j loop2
		saida2:
		add $t5, $t0, $s3
		div $t3, $t3, 6
		sw $t3, 0($t5)
		addi $t0, $t0, 4
		j loop1
	saida1:
	
	la $a0, saidax
	li $v0, 4
	syscall
	
	addi $t0, $0, 0
	loop3:
		beq $t0, $s0, saida3
		add $t1, $t0, $s2
		lw $a0, 0($t1)
		addi $v0, $0, 1
		syscall
		addi $t0, $t0, 4
		addi $v0, $0, 11
		lb $a0, linha
		syscall
		j loop3
	saida3:
	
	la $a0, saiday
	li $v0, 4
	syscall
	
	addi $t0, $0, 0
	loop4:
		beq $t0, $s1, saida4
		add $t1, $t0, $s3
		lw $a0, 0($t1)
		addi $v0, $0, 1
		syscall
		
		addi $t0, $t0, 4
		
		addi $v0, $0, 11
		lb $a0, linha
		syscall
		
		j loop4
	saida4:
	
	
	
