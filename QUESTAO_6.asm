.data

.text
main:
	addi $v0, $0, 5
	syscall
	move $s0, $v0
	add $v0, $0, $0
	add $a0, $0, $s0
	jal sequencia
	
	add $a0, $0, $v0
	addi $v0, $0, 1
	syscall
	
	addi $v0, $0, 10
	syscall
	
sequencia:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	bne $a0, 1, cont0
		add $v0, $0, $0
		j volta
		
	cont0:
	bne $a0, 2, cont1
		addi $v0, $0, 1
		j volta

	cont1:
		addi $sp, $sp, -4
		sw $a0, 0($sp)
		subi $a0, $a0, 1
		jal sequencia
		lw $a0, 0($sp)
		addi $sp, $sp, 4
		
		addi $sp, $sp, -4
		add $s0, $0, $v0
		sw $s0, 0($sp)
		
		subi $a0, $a0, 2
		jal sequencia
		add $t1, $0, $v0
		lw $s0, 0($sp)
		addi $sp, $sp, 4
		
		add $v0, $s0, $t1
		j volta
	volta:
		lw $ra, 0($sp)
		addi $sp, $sp, 4	
		jr $ra
