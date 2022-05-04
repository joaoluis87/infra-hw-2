.data
	ANOS: .asciiz " anos, "
	MESES: .asciiz " meses, "
	DIAS: .asciiz " dias, "
	HORAS: .asciiz " horas, "
	MINUTOS: .asciiz " minutos e "
	SEGUNDOS: .asciiz " segundos"
	db: .float 2.0
	zero: .float 0.0
	int: .word 0
	zeroum: .float 0.1
.text
	lwc1 $f6, zeroum
	
	#ler o double
	li $v0, 6
	syscall
	
	lwc1 $f1, db
	div.s $f2, $f0, $f1
	add.s $f2, $f2, $f6
	cvt.w.s $f3, $f2
	round.w.s $f4, $f2
	mfc1 $s0, $f3
	mfc1 $s1, $f4
	
	#calcular anos
	li $t2, 31104000
	
	div $s0, $t2
	
	mflo $t0
	mfhi $t3
	
	div $s1, $t2
	
	mflo $t1
	mfhi $t4
	#138 
	add $t4 ,$t4, $t3
	div $t4, $t2
	
	mflo $t5
	
	add $t1, $t5, $t1
	add $t1, $t1, $t0
	
	addi $v0, $0, 1
	add $a0, $0, $t1
	syscall
	
	li $v0, 4
	la $a0, ANOS
	syscall

	#calcular meses
	mfhi $t1
	li $t2, 2592000
	div $t1, $t2
	
	mflo $t0
	addi $v0, $0, 1
	add $a0, $0, $t0
	syscall
	
	li $v0, 4
	la $a0, MESES
	syscall
	
	#calcular dias
	mfhi $t1
	li $t2, 86400
	div $t1, $t2
	
	mflo $t0
	addi $v0, $0, 1
	add $a0, $0, $t0
	syscall
	
	li $v0, 4
	la $a0, DIAS
	syscall
	
	#calcular horas
	mfhi $t1
	li $t2, 3600
	div $t1, $t2
	
	mflo $t0
	addi $v0, $0, 1
	add $a0, $0, $t0
	syscall
	
	li $v0, 4
	la $a0, HORAS
	syscall
	
	#calcular minutos
	mfhi $t1
	li $t2, 60
	div $t1, $t2
	
	mflo $t0
	addi $v0, $0, 1
	add $a0, $0, $t0
	syscall
	
	li $v0, 4
	la $a0, MINUTOS
	syscall
	
	#calcular segundos
	mfhi $t1
	li $t2, 1
	div $t1, $t2
	
	mflo $t0
	addi $v0, $0, 1
	add $a0, $0, $t0
	syscall
	
	li $v0, 4
	la $a0, SEGUNDOS
	syscall
	
	
