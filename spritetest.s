.data

VGAADDR: .word 0xFF000000
VRAMPOINTER: .word	0xFF100000

ERROR_EXIT_CODE: .byte 0x00

testsprite: 
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
0x00, 0x00, 0x00, 0x00, 0x05, 0x55, 0x55, 0x00, 0x16, 0xAA, 0xA9, 0x40, 0x5A, 0xAA, 0xAA, 0x50, 
0x5A, 0xAA, 0xA9, 0x54, 0x66, 0xAA, 0x95, 0xA4, 0x69, 0x55, 0x5A, 0xA4, 0x6A, 0xAA, 0xAA, 0x94, 
0x6A, 0xAA, 0xAA, 0x50, 0x5A, 0xAA, 0xA9, 0x40, 0x15, 0x55, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00
testsprite_palette: .word 0xC707FFC7
testsprite_address: .word 0x00000000
.eqv VGAADDRESSINI      0xFF000000
.eqv VGAADDRESSFIM      0xFF012C00




.text
	
	li a0, 0x00000000
	jal clsCLS
	
	
	la a0, testsprite
	lw a1, testsprite_palette
	jal uncompress
	la t0, testsprite_address
	sw a0, 0(t0)
	
	li a0, 0
	li a1, 0
	jal getaddress
	mv a1, a0
	lw a0, testsprite_address
	jal drawtile
	
	li a0, 300
	li a1, 0
	jal getaddress
	mv a1, a0
	lw a0, testsprite_address
	jal drawtile
	
	li a0, 	0
	li a1, 220
	jal getaddress
	mv a1, a0
	lw a0, testsprite_address
	jal drawtile
	
	li a0, 300
	li a1, 220
	jal getaddress
	mv a1, a0
	lw a0, testsprite_address
	jal drawtile


	
	li a7 10
	ecall


#############################################################################
# uncompress()
#
# description:
# This function uncompresses tiles to a specific location
# in memory. The tiles are decompressed in color bytes, based
# on the palette defined at the sprite_palette
#
# inputs:
# a0 - address of compressed sprite
# a1 - sprite palette, four colours
#
# outputs:
# a0 - address where the sprite was decompressed
##############################################################################
uncompress:
	addi sp, sp, -80
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	sw s3, 12(sp)
	sw s4, 16(sp)
	sw s5, 20(sp)
	sw s6, 24(sp)
	sw s7, 28(sp)
	sw s8, 32(sp)
	sw s9, 36(sp)
	sw s10, 40(sp)
	sw s11, 44(sp)
	sw t0, 48(sp)
	sw t1, 52(sp)
	sw t2, 56(sp)
	sw t3, 60(sp)
	sw t4, 64(sp)
	sw t5, 68(sp)
	sw t6, 72(sp)
	sw ra, 76(sp)



	mv s0, a0 # save sprite address
	mv s1, a1 # save sprite palette
	li t0, 64 # number of bytes to read from sprite_address
	 
	 lw s2, VRAMPOINTER
	 mv s11, s2 # the original VRAMPOINTER, will be the a0 output at the end 
	 li t1, 0

	 # for t1 = 0; t1 != t0; t1++
	uncompress_for: beq t1, t0, uncompress_forend

		add t3, s0, t1 # store byte address to be read
		lb t3, 0(t3) # fetches the byte
		
		li t2, 0xC0 # first pixel mask
		and t6, t3, t2 # and with the byte
		srli t6, t6, 6 # move to less significant bits
		jal uncompress_switch
		addi s2, s2, 1

		li t2, 0x30 # second pixel
		and t6, t3, t2
		srli t6, t6, 4
		jal uncompress_switch
		addi s2, s2, 1

		li t2, 0x0C # third pixel
		and t6, t3, t2
		srli t6, t6, 2
		jal uncompress_switch
		addi s2, s2, 1

		li t2, 0x03 # fourth pixel
		and t6, t3, t2
		jal uncompress_switch
		addi s2, s2, 1



		addi t1, t1, 1 # increment iterator
		j uncompress_for


		uncompress_switch:
			# load masks in t2, compare to the byte read and go to according label
			li t2, 0 
			beq t6, t2, uncompress_switch00
			li t2, 1
			beq t6, t2, uncompress_switch01
			li t2, 2
			beq t6, t2, uncompress_switch10
			li t2, 3
			beq t6, t2, uncompress_switch11
			# in case there's another value (exception)
			li t0, 1 # sprite uncompress error
			la t1, ERROR_EXIT_CODE
			sb t0, 0(t1) 


		 	uncompress_switch00:
		 		li t2, 0xFF000000 # load mask 
		 		and a0, s1, t2 # get color from sprite palette
		 		srli a0, a0, 24 # adjust bits
		 		sb a0, 0(s2) # store pixel at VRAMPOINTER
		 		j uncompress_switchend 
		 	uncompress_switch01:
		 		li t2, 0x00FF0000 # load mask 
		 		and a0, s1, t2 # get color from sprite palette
		 		srli a0, a0, 16 # adjust bits
		 		sb a0, 0(s2) # store pixel at VRAMPOINTER
		 		j uncompress_switchend 
		 	uncompress_switch10:
		 		li t2, 0x0000FF00 # load mask 
		 		and a0, s1, t2 # get color from sprite palette
		 		srli a0, a0, 8 # adjust bits
		 		sb a0, 0(s2) # store pixel at VRAMPOINTER
		 		j uncompress_switchend 
		 	uncompress_switch11:
		 		li t2, 0x000000FF # load mask 
		 		and a0, s1, t2 # get color from sprite palette
		 		sb a0, 0(s2) # store pixel at VRAMPOINTER
		 		j uncompress_switchend 
	 	uncompress_switchend:	 		
	 		jalr zero, ra,0

	uncompress_forend:
		mv a0, s11 # return value
		la t0, VRAMPOINTER
		sw s2, 0(t0)

		lw s0, 0(sp)
		lw s1, 4(sp)
		lw s2, 8(sp)
		lw s3, 12(sp)
		lw s4, 16(sp)
		lw s5, 20(sp)
		lw s6, 24(sp)
		lw s7, 28(sp)
		lw s8, 32(sp)
		lw s9, 36(sp)
		lw s10, 40(sp)
		lw s11, 44(sp)
		lw t0, 48(sp)
		lw t1, 52(sp)
		lw t2, 56(sp)
		lw t3, 60(sp)
		lw t4, 64(sp)
		lw t5, 68(sp)
		lw t6, 72(sp)
		lw ra, 76(sp)
		addi sp, sp 80
		jalr zero,ra, 0

	 	
#input: a0 (tile address) !!UNCOMPRESSED!!
#	a1 (draw address)
drawtile:
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	addi a0, a0, 16
	addi a1, a1, 320
	lw t0, 0(a0)
	sw t0, 0(a1)
	lw t0, 4(a0)
	sw t0, 4(a1)
	lw t0, 8(a0)
	sw t0, 8(a1)
	lw t0, 12(a0)
	sw t0, 12(a1)
	
	jalr zero, ra, 0

	
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
	li t0, 0xff000000
	add a0, a0, t0
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
