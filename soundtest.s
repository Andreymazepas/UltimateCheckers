.data

CONT:		.word 55
INIT:		.word 0
INSTRUMENTO:	.word 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 

DELAY:		.word 0, 240, 0, 240, 240, 0, 240, 0, 240, 0, 480, 0, 120, 120, 0, 240, 0, 120, 120, 240, 0, 240, 0, 240, 0, 240, 240, 0, 240, 0, 240, 0, 0, 240, 240, 240, 240, 0, 480, 240, 0, 0, 0, 0, 240, 0, 480, 240, 0, 240, 0, 0, 0, 0, 240, 0, 120, 120, 0, 0, 0, 240, 0, 0, 240, 240, 0, 0, 240, 
NOTAS:		.word  60, 64, 67, 91, 91, 60, 91, 57, 60, 64, 91, 57, 89, 88, 53, 57, 60, 89, 91, 88, 53, 86, 55, 59, 62, 84, 86, 55, 88, 60, 84, 64, 67, 79, 60, 57, 60, 64, 57, 72, 77, 81, 84, 53, 57, 60, 53, 86, 55, 74, 79, 83, 59, 62, 86, 67, 69, 74, 79, 83, 67, 72, 76, 48, 55, 67, 60, 64, 76, 
DURACAO: 	.word 239, 239, 239, 227, 227, 119, 683, 239, 239, 239, 113, 119, 113, 341, 239, 239, 239, 113, 227, 227, 119, 455, 239, 239, 239, 227, 227, 119, 227, 239, 227, 239, 239, 911, 119, 239, 239, 239, 119, 911, 911, 911, 911, 239, 239, 239, 119, 119, 239, 119, 119, 119, 119, 119, 119, 
VOLUME:		.word  80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 

.text

j MAIN

.macro	sound(%base_note, %note, %duration, %instrument, %volume)
	lw a0, 0(%note)
	add a0, a0, %base_note
	lw a1, 0(%duration)
	li a2, 80
	li a3, 250
	jal SOUND
.end_macro
SOUND:
	addi a1,a1,320
	#mul $a1,$a1,12
	li t0, 100
	bge s0,t0,PULA
	addi a1,a1,195
PULA:	#li $a2,24
	li a7, 31	#syscall for midi
	ecall
	jr ra

.macro	sleep(%duration)
	lw a0, 0(%duration)
	jal SLEEP
.end_macro
SLEEP:
	addi a0,a0,10
	#mul $a0,$a0,2
	#li $a0,125
	li a7, 32	#syscall for sleep
	ecall
	jr ra

MAIN:
	lw s0, CONT		#quant de notas
	lw s1, INIT		#nota inicial
	la s2, NOTAS		#notas
	la s3, DURACAO		#duracoes
	la s4, DELAY		#delay
	la s5, VOLUME		#volume
	la s6, INSTRUMENTO	#instrumento
LOOP1:
	sound(s1,s2,s3,s6,s5)
	sleep(s4)

	beqz s0, DEPOIS

	addi s0, s0, -1
	addi s2, s2, 4
	addi s3, s3, 4
	addi s4, s4, 4
	addi s5, s5, 4
	#addiu $s6, $s6, 4

	j LOOP1
DEPOIS:	li a7,10
	ecall
