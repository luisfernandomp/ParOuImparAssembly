.data
	entrada: .asciiz "Entre com um valor inteiro: "
	saida: .asciiz "O número "
	par: .asciiz " é par"
	impar: .asciiz " é ímpar"
.text
	
j main

# Função para imprimir strings na tela
printString:
	li $v0, 4
	syscall
	jr $ra

main: 
	# Imprime texto entrada na tela 
	la $a0, entrada
	jal printString
	
	# Lê um inteiro
	li $v0, 5
	syscall
	
	# Armazena resultado no registrador $t0
	move $t0, $v0
	
	# Imprime texto saida na tela 
	la $a0, saida 
	jal printString
	
	li $v0, 1
	la $a0, ($t0) 
	syscall
	
	li $t1, 2 # Armazena o valor 2 em $t1
	
	div $t0, $t1 # Divisão de $t0 por 2
	
	mfhi $t2 # Pega o resto da divisão por 2 e armazena em $t2
	
	# Verifica se o resto é igual a ZERO
	# Se for então irá chamar o bloco imprimePar
	# Senão irá continuar com a execução do bloco abaixo de beq
	# e por fim fazer um salto para fim
	beq $t2, $zero, imprimePar
	
	la $a0, impar
	jal printString
	
	j fim
	
	# Bloco se $t2 for igual a zero (número par)
	imprimePar:
		la $a0, par
		jal printString
	
	# Encerra o programa
	fim:
		li $v0, 10
		syscall
