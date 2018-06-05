.data
cursor: .word 0x00005000, 0x00006900, 0x00001A40, 0x00000690,
0x000001A4, 0x00000069, 0x0000001A, 0x40000056,
0x94000069, 0xA694151A, 0x69A64696, 0xAAA9A5A9,
0xAAAA691A, 0x6AAAAA41, 0x9AAAAA90, 0x6AAAAAA4,
0x06AAAAA9, 0x01AAAAA9, 0x001AAAAA, 0x4006AAAA,
0x90006AAA, 0x90001AAA, 0xA4000555, 0x55000000
cursor_data: .word 0xAC000440
cursor_address: .word 0x00000000
VGAADDR: .word 0xFF000000
VRAMPOINTER: .word	0xFF100000
palette: .word 0xC700FF00, 0x00000000, 0x00000000, 0x00000000,
		0x00000000, 0x00000000, 0x00000000, 0x00000000
.eqv VGAADDRESSINI      0xFF000000
.eqv VGAADDRESSFIM      0xFF012C00


.text
	lw s0 VGAADDR
	li a0, 0xFF012C00
	li t0, 0x07
	sb t0, 0(a0)
	jal getcoordinates
	jal getaddress
	
	li a0, 0x000000FF
	jal clsCLS
	
	la a0, cursor
	lw a1, cursor_data
	jal uncompress
	la t0, cursor_address
	sw a0, 0(t0)
	
	lw a0, cursor_address
	lw a1, VGAADDR
	lw a2, cursor_data
	jal drawsprite
	
	li a7 10
	ecall

#input: a0 (sprite address)
#	a1 (sprite data)
#output:a0 (vram address)
uncompress:
	li t0, 0xF8000000
	 and t0, a2, t0 #height
	 srli t0, t0, 27
	 addi t0, t0, 1
	 li t1, 0x07C00000
	 and t1, a2, t1 #width
	 srli t1, t1, 22
	 addi t1, t1, 1
	 mul t0, t0, t1 #number of pixels
	 li t1, 4
	 div t0, t0, t1 #number of bytes to read
	 
	 lw t6, VRAMPOINTER 
	 li t1, 0
	uncompress_for: beq t1, t0, uncompress_forend
	 	uncompress_switch00:
	 		li t2, 0xFF000000
	 		and t2, s11, t2
	 		srli t2, t2, 24
	 		sb t2, 0(t6)
	 		j uncompress_switchend
	 	uncompress_switch01:
	 		li t2, 0x00FF0000
	 		and t2, s11, t2
	 		srli t2, t2, 16
	 		sb t2, 0(t6)
	 		j uncompress_switchend
	 	uncompress_switch10:
	 		li t2, 0x0000FF00
	 		and t2, s11, t2
	 		srli t2, t2, 8
	 		sb t2, 0(t6)
	 		j uncompress_switchend
	 	uncompress_switch11:
	 		li t2, 0x000000FF
	 		and t2, s11, t2
	 		sb t2, 0(t6)
	 		j uncompress_switchend
	 	uncompress_switchend:
	 		addi t1, t1, 1
	 		addi t6, t6, 1
	 		j uncompress_for
	 uncompress_forend:
	 	
	 	
#input: a0 (sprite address) !!UNCOMPRESSED!!
#	a1 (draw address)
#	a2 (sprite data)
drawsprite:
	 li t0, 0xF8000000
	 and t0, a2, t0 #height
	 srli t0, t0, 27
	 addi t0, t0, 1
	 li t1, 0x07C00000
	 and t1, a2, t1 #width
	 srli t1, t1, 22
	 addi t1, t1, 1
	 #for (t2 <- 0 until height){
	 #	for (t3 <- 0 until width){
	 #		a1 = a0[t2][t3]
	 #		t3++
	 li t2, 0
	 mv t6, a0 #sprite address
	 drawsprite_for1: beq t2, t0, drawsprite_endfor1
	 	li t4, 320
	 	mul t4, t2, t4 
	 	add t5, a1, t4 #t5 = temporary draw address height
	 	li t3, 0
	 	drawsprite_for2: beq t3, t1, drawsprite_endfor2
	 		lb s11 0(t6)
	 		sb s11 0(t5)
	 		addi t6, t6, 1
	 		addi t5, t5, 1
	 		addi t3, t3, 1
	 		j drawsprite_for2
	 	drawsprite_endfor2:
	 	addi t2, t2, 1
	 	j drawsprite_for1
	 drawsprite_endfor1:
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
	
#input: a0 (color)
clsCLS:	li      t1, VGAADDRESSINI       # Memoria VGA
   	li 		t2, VGAADDRESSFIM
    	andi	a0, a0, 0x00FF
    	li 		t0, 0x01010101
    	mul		a0, t0, a0

forCLS:	beq     t1, t2, fimCLS
		sw    	a0, 0(t1)
    	addi    t1, t1, 4
    	j       forCLS
    	
fimCLS:	jalr 	zero,ra,0
