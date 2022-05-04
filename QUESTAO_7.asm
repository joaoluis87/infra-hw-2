.text
main:
	addi $v0, $0, 5
	syscall		#lendo q
	add $s0, $0, $v0
	
	addi $v0, $0, 5
	syscall		#lendo n
	add $s1, $0, $v0
	
	#mul $s1, $s1, 4 
	#add $a0, $0, $s1
	#addi $a0, $0, 9
	#syscall
	#add $s2, $0, $v0
	
	add $a0, $0, $s1 # enviando n
	add $a1, $0, $s0 #enviando q

	jal pg
	
	add $s3, $0, $v0
	
	addi $v0, $0, 1	
	add $a0, $0, $s3
	syscall
	
	addi $v0, $0, 10
	syscall
pg:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	bne $a0, 0, cont0
		add $v0, $0, 1
		j return
	cont0:
	bne $a0, 1, cont1
		add $v0, $0, $a1
		j return
	cont1:
		subi $a0, $a0, 1
		jal pg
		mul $v0, $v0, $a1
	return:
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra