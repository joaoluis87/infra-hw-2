.data
	linha: .byte '\n'
	espacamento: .asciiz ", "

.text
	addi $v0, $0, 5
	syscall
	move $s0, $v0
	
	loop0:
	slt $t0, $0, $s0 
	beq $t0, $0, exit0
		
		addi $v0, $0, 11
		lb $a0, linha
		syscall
		
		addi $t1, $s0, 1
		addi $t2, $0, 1
		loop1:
		
			add $a0, $0, $t2
			addi $v0, $0, 1
			syscall
			
			addi $t2, $t2, 1
			
			slt $t0, $t2, $t1
			beq $t0, $0, exit1
			
			addi $v0, $0, 4
			la $a0, espacamento
			syscall
			
			j loop1
			exit1:
		sub $s0, $s0, 1
		
		j loop0
	exit0:
	
