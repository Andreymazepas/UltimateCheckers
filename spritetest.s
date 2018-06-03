.data
cursor: .word 0x00005000, 0x00006900, 0x00001A40, 0x00000690,
0x000001A4, 0x00000069, 0x0000001A, 0x40000056,
0x94000069, 0xA694151A, 0x69A64696, 0xAAA9A5A9,
0xAAAA691A, 0x6AAAAA41, 0x9AAAAA90, 0x6AAAAAA4,
0x06AAAAA9, 0x01AAAAA9, 0x001AAAAA, 0x4006AAAA,
0x90006AAA, 0x90001AAA, 0xA4000555, 0x55000000
cursor_data: .word 0x1611
VGAADDR: .word 0xFF000000
.text
	lw s0 VGAADDR
	li a0, 0xFF00013F
	li t0, 0x07
	sb t0, 0(a0)
	jal getcoordinates
	jal getaddress
	
	li a7 10
	ecall

#input: a0 (sprite address)
#	a1 (draw address)
#	a2 (sprite data)
drawsprite:
	
	
opa:	la s1 cursor
	lw a0 0(s1)
	mv a1 s0
	addi s0, s0, 321
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	addi s1, s1, 4
	addi a1, a1, 320
	lw a0, 0(s1)
	jal magic
	j opa
	li a7 10
	ecall
	
	
magic: 	li t0, 1 #1,2,4,8,16,32,64,128,256, 512, 1024, 2048, 4096, 
	li t1, 32
	li t2, 0
	
loopmagic:	beq t2, t1, magic_end	 
		and t3, a0, t0
		srl t3, t3, t2
		add t4, a1, t2 #address offset
		beqz t3, branco
		li t3, 0x07
		sb t3, 0(t4)
		j pula_branco
	branco: li t3, 0xFF
		sb t3, 0(t4)
	pula_branco: slli t0, t0, 1
		addi t2, t2, 1
		j loopmagic
	magic_end:
	jr ra

#input: a0 (address)
#output: a0 (x)
#	 a1 (y)
getcoordinates:
	li t0, 0x0001FFFF #mask relevant bits
	and a0, a0, t0
	li t0, 320
	div t1, a0, t0
	rem t2, a0, t0
	mv a1, t1
	mv a0, t2
	jr ra


#input: a0 (x)
#	 a1 (y)
#output: ao (address)
getaddress:
	li t0, 320
	mul a1, a1, t0
	add a1, a1, a0
	mv a0, a1
	jr ra