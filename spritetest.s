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

# SPRITE DATA:
# 00000		00000	00		00000 00000 00000 00000
# height    width   frames  Palette(00,01,10,11)


.text
	lw s0 VGAADDR
	li a0, 0xFF012C00
	li t0, 0x07
	sb t0, 0(a0)
	jal getcoordinates
	jal getaddress
	
	li a0, 0x00000046
	jal clsCLS
	
	li a7 10
	ecall
	
	
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

# input: a0 (color index)
# output: a0 (color)

#input: a0 (sprite address)
#	a1 (sprite data)
#output:a0 (vram address)
uncompress:
	mv s0, a0 # save sprite address
	mv s1, a1 # save sprite data
	li t0, 0xF8000000 # store mask in t0
	 and t0, s1, t0 # get height from sprite data
	 srli t0, t0, 27 # adjust to less significant bits
	 addi t0, t0, 1 # add 1, so it starts at 1
	 li t1, 0x07C00000 # store mask in t1
	 and t1, s1, t1 # get width from sprite data
	 srli t1, t1, 22 # adjust bits
	 addi t1, t1, 1 # add 1
	 mul t0, t0, t1 # number of pixels (2 bits), width * height
	 li t1, 4 # 2 bits * 4 = 1 byte
	 div t0, t0, t1 # number of bytes to read
	 
	 lw s2, VRAMPOINTER
	 mv s11, s2 # the original VRAMPOINTER, will be the a0 output at the end 
	 li t1, 0

	 # for t1 = 0; t1 != t0; t1++
	uncompress_for: beq t1, t0, uncompress_forend

		add t3, s0, t1 # store byte address to be read
		lw t3, 0(t3) # fetches the byte

	 	uncompress_switch00:
	 		li t2, 0x000F8000 # load mask 
	 		and a0, s1, t2 # get color index from sprite data
	 		srli a0, a0, 24 # adjust bits
	 		jal get_color # get_color(index)
	 		li t2, 0xC7 # transparency color
	 		beq a0, t2, uncompress_switchend # if color == transparency, do nothing
	 		sb a0, 0(s2) # store pixel at VRAMPOINTER
	 		j uncompress_switchend
	 	uncompress_switch01:
	 		li t2, 0x00007C00
	 		and a0, s1, t2
	 		srli a0, a0, 16
	 		jal get_color
	 		li t2, 0xC7
	 		beq a0, tw, uncompress_switchend
	 		sb a0, 0(s2)
	 		j uncompress_switchend
	 	uncompress_switch10:
	 		li t2, 0x000003E0
	 		and a0, s1, t2
	 		srli a0, a0, 8
	 		jal get_color
	 		li t2, 0xC7
	 		beq a0, tw, uncompress_switchend
	 		sb a0, 0(s2)
	 		j uncompress_switchend
	 	uncompress_switch11:
	 		li t2, 0x0000001F
	 		and a0, s1, t2
	 		jal get_color
	 		li t2, 0xC7
	 		beq a0, tw, uncompress_switchend
	 		sb a0, 0(s2)
	 		j uncompress_switchend
	 	uncompress_switchend:
	 		addi t1, t1, 1 # increment iterator
	 		addi s2, s2, 1 # increment VRAMPOINTER
	 		j uncompress_for
	 uncompress_forend:
	 # TODO store and load variables
	 # TODO get_color
	 	
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
