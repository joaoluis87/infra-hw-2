.data
	A: .word
	B: .word
	C: .word	
	D: .word
	true: .asciiz "TRUE"
	false: .asciiz "FALSE"
.text
	li $v0, 5
	syscall		#lendo A
	move $s0, $v0
	
	li $v0, 5
	syscall		#lendo B
	move $s1, $v0
	
	li $v0, 5
	syscall		#lendo C
	move $s2, $v0
	
	li $v0, 5
	syscall		#lendo D
	move $s3, $v0
	
	add $t0, $s0, $s3 #t0 = A + D
	bne $t0, 7, Elseif
		j True
	Elseif:
		bne $s1, 2, Else
		bne $s2, 5, True
	Else:
		li $v0, 4
		la $a0, false
		syscall
		j Exit
	True:
		li $v0, 4
		la $a0, true
		syscall
	
	Exit:
