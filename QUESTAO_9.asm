.data
	string: .space 20
	fim: .byte '\n'
.text
main:
	addi $v0, $0, 8
	la $a0, string
	addi $a1, $0, 20
	syscall
	la $a0, string
	jal tamanho
	
	add $a0, $0, $v0
	addi $v0, $0, 1
	syscall
	
	addi $v0, $0, 10
	syscall
	
tamanho:
	add $t0, $0, $a0
	lb $t1, fim
	loop:
	lb $t2, 0($t0)
	beq $t2, $t1, voltar
		addi $t0, $t0, 1
	j loop
	voltar:
	sub $v0, $t0, $a0
	jr $ra