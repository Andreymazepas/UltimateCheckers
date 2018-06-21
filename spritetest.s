.data

	VGAADDR: .word 0xFF000000
	VRAMPOINTER: .word	0xFF100000

	ERROR_EXIT_CODE: .byte 0x00

	testsprite: 
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x0F,0x03,
	  0x0D,0xCD,0x0D,0xF5,0x0D,0xE7,0x35,0x59,
	  0x39,0x55,0x35,0x56,0x39,0x55,0x39,0x55,
	  0x0E,0x55,0x0F,0xA9,0x03,0xFF,0x00,0x00,
	  0x00,0x00,0x00,0x00,0xFC,0x00,0x5F,0x00,
	  0x75,0xC0,0xD7,0x70,0x5D,0x70,0x75,0xF0,
	  0x97,0x70,0x5D,0x70,0x65,0xC0,0x57,0x00,
	  0x5C,0x00,0x70,0x00,0xC0,0x00,0x00,0x00
	testsprite_palette: .word 0x00FFFFFF
	testsprite_address: .word 0x00000000
	testsprite_x: .word 0
	testsprite_y: .word 0
	testsprite_position: .word 0xFF000000
	moved: .word 0


	testpiece:
	 .byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	  0x03,0xFF,0x0F,0xAA,0x0E,0xAA,0x0E,0xA5,
	  0x0E,0x95,0x0E,0x95,0x0E,0xA5,0x0E,0xAA,
	  0x0F,0xAA,0x03,0xFF,0x00,0x00,0x00,0x00,
	  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	  0xFF,0x00,0xAB,0xC0,0xAA,0xC0,0x6A,0xC0,
	  0x5A,0xC0,0x5A,0xC0,0x6A,0xC0,0xAA,0xC0,
	  0xAA,0xC0,0xFF,0x00,0x00,0x00,0x00,0x00
	testpiece_palette: .word 0x00FFFFFF
	testpiece_address: .word 0x00000000
	testpiece_position: .word 0xff007dc8
	pieces: 
		.byte 	0x80, 0x82, 0x84, 0x86, 0x89, 0x8b, 0x8d, 0x8f, 0x90, 0x92, 0x94, 0x96
			0x29, 0x2b, 0x2d, 0x2f, 0x30, 0x32, 0x34, 0x36, 0x39, 0x3b, 0x3d, 0x3f
	#####################################
	cpupiece:
		.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x0F,0x03,
	  0x0D,0xCD,0x0D,0xF5,0x0D,0xE7,0x35,0x59,
	  0x39,0x55,0x35,0x56,0x39,0x55,0x39,0x55,
	  0x0E,0x55,0x0F,0xA9,0x03,0xFF,0x00,0x00,
	  0x00,0x00,0x00,0x00,0xFC,0x00,0x5F,0x00,
	  0x75,0xC0,0xD7,0x70,0x5D,0x70,0x75,0xF0,
	  0x97,0x70,0x5D,0x70,0x65,0xC0,0x57,0x00,
	  0x5C,0x00,0x70,0x00,0xC0,0x00,0x00,0x00
	cpudame:
		.byte
	cpupiece_palette: .word 0x00FFFFFF
	cpupieceaddress: .word 0x00000000
	cpudameaddress: .word 0x00000000
	##################################
	playerpiece:
		.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	  0x03,0xFF,0x0F,0xAA,0x0E,0xAA,0x0E,0xA5,
	  0x0E,0x95,0x0E,0x95,0x0E,0xA5,0x0E,0xAA,
	  0x0F,0xAA,0x03,0xFF,0x00,0x00,0x00,0x00,
	  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	  0xFF,0x00,0xAB,0xC0,0xAA,0xC0,0x6A,0xC0,
	  0x5A,0xC0,0x5A,0xC0,0x6A,0xC0,0xAA,0xC0,
	  0xAA,0xC0,0xFF,0x00,0x00,0x00,0x00,0x00
	playerdame:
		.byte
	playerpiece_palette: .word 0x00FFFFFF
	playerpieceaddress: .word 0x00000000
	playerdameaddress: .word 0x00000000
	##############################
	boarddrawaddresses: 
		.word 0xff000000, 0xFF000011, 0xff000022, 0xff000033, 0xff000044, 0xff000055, 0xff000066, 0xff000077
			0xff001900, 0xFF001911, 0xff001922, 0xff001933, 0xff001944, 0xff001955, 0xff001966, 0xff001977
			0xff003200, 0xFF003211, 0xff003222, 0xff003233, 0xff003244, 0xff003255, 0xff003266, 0xff003277
			0xff004b00, 0xFF004b11, 0xff004b22, 0xff004b33, 0xff004b44, 0xff004b55, 0xff004b66, 0xff004b77
			0xff006400, 0xFF006411, 0xff006422, 0xff006433, 0xff006444, 0xff006455, 0xff006466, 0xff006477
			0xff007d00, 0xFF007d11, 0xff007d22, 0xff007d33, 0xff007d44, 0xff007d55, 0xff007d66, 0xff007d77
			0xff009600, 0xFF009611, 0xff009622, 0xff009633, 0xff009644, 0xff009655, 0xff009666, 0xff009677
			0xff00af00, 0xFF00af11, 0xff00af22, 0xff00af33, 0xff00af44, 0xff00af55, 0xff00af66, 0xff00af77
	board: 
		.byte 		0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00
				0x00, 0x05, 0x00, 0x06, 0x00, 0x07, 0x00, 0x08
				0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0C, 0x00
				0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
				0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
				0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
				0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
				0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	COLOR_PALETTE: .word 0x49A274FE
	selectedcursorpos: .word 0xff006400
	.eqv VGAADDRESSINI      0xFF000000
	.eqv VGAADDRESSFIM      0xFF012C00
	.eqv BG1ADDRESSINI	0xFF300000
	.eqv BG2ADDRESSINI	0xFF400000
	.eqv FRAMEWAIT		15


.text
	# MAIN
		li a0, 0x00000000
		jal clsCLS
		#li a0, 0xff000000
		#jal rainbowcls
		#li a0, 0xff300000
		#jal rainbowcls
		
		
		la a0, testsprite
		lw a1, testsprite_palette
		jal uncompress
		la t0, testsprite_address
		sw a0, 0(t0)

		la a0, testpiece
		lw a1, testpiece_palette
		jal uncompress
		la t0, testpiece_address
		sw a0, 0(t0)

		la a0, playerpiece
		lw a1, playerpiece_palette
		jal uncompress
		la t0, playerpieceaddress
		sw a0, 0(t0)
		
		la a0, cpupiece
		lw a1, cpupiece_palette
		jal uncompress
		la t0, cpupieceaddress
		sw a0, 0(t0)
		
		li t1, 1
		li t0, 25
		looppiece:
		beq t1, t0, jooj
		mv a0, t1
		jal getpiece
		jal drawpiece
		addi t1,t1, 1
		j looppiece
	jooj:
		li a0, 20
		li a1, 7
		li a2, 3
		movepiece:
			mv s0, a0
			mv s1, a1
			mv s2, a2
			jal getpiece
			jal getpiecedrawaddress
			mv s3, a0
			jal getcoordinates
			addi a1, a1, -16
			la a2, testsprite_position
			la a3, testsprite_address
			jal MOVE_OBJECT
			
			mv a0, s3
			jal undrawtile
			jal removefromBG1
			mv a0, s1
			mv a1, s2
			jal getboardfromxy
			jal getcoordinates
			la a2, testsprite_position
			la a3, testsprite_address
			la a4, testpiece_address
			la a5, testpiece_position
			jal MOVE_2OBJECTS
			mv a0, s3
			jal removefromBG1
			mv a0, s0
			mv a1, s1
			mv a2, s2
			#jal updatepiecepos
			mv a0, s0
			jal getpiece
			#jal drawpiece
			j EXIT
			
			
		li a0, 0xff007dc8
		jal getcoordinates
		addi a0, a0, 32
		la a2, testsprite_position
		la a3, testsprite_address
		jal MOVE_OBJECT
		addi a0, a0, -64
		jal MOVE_OBJECT
		addi a0, a0, 64
		jal MOVE_OBJECT
		j EXIT
		
		
		li a0, 50
		li a1, 200
		la a2, testsprite_position
		la a3, testsprite_address
		la a4, testpiece_address
		la a5, testpiece_position
		jal MOVE_2OBJECTS
		la t1, testsprite_position
		lw t0, 0(t1)
		li t2, -1600
		add t0, t0, t2
		sw t0, 0(t1)

		la a0, testpiece_address
		lw a0, 0(a0)
		la a1, testpiece_position
		lw a1, 0(a1)
		jal drawtile
		
		li a0, 0xff000000
		jal getcoordinates
		la a2, testsprite_position
		la a3, testsprite_address
		jal MOVE_OBJECT
		
		li a7, 10
		ecall
	#	
		# PIECES LOGIC
			getpiece:
				addi sp, sp, -4
				sw a1, 0(sp) # back up a1
				
				addi a0, a0, -1 #pieces start at 1
				la a1, pieces 
				add a0, a1, a0 # add number
				lb a0, 0(a0) # get piece
				li a1, 0x000000FF
				and a0, a1, a0

				lw a1, 0(sp)
				addi sp, sp, 4
				jalr zero, ra, 0 # return

			getpiecepos:
				li a1, 0x00000038
				and a1, a0, a1
				srli a1, a1, 3
				andi a0, a0, 7
				jalr zero, ra, 0

			getpiecedrawaddress:
				addi sp, sp, -4
				sw ra, 0(sp)

				#li a1, 0x00000038
				#and a1, a0, a1
				#srli a1, a1, 3
				#andi a0, a0, 7
				jal getboarddrawaddress

				lw ra, 0(sp)
				addi sp, sp, 4
				jalr zero, ra, 0

			getpieceisdame:
				andi a0, a0, 0x40
				srli a0, a0, 6
				jalr zero, ra, 0

			getpieceteam:
				andi a0, a0, 0x80
				srli a0, a0, 7
				jalr zero, ra, 0

			drawpiece:
				addi sp, sp, -16
				sw s0, 0(sp)
				sw a0, 4(sp)
				sw a1, 8(sp)
				sw ra, 12(sp)

				mv s0, a0
				jal getboarddrawaddress
				mv s1, a0
				mv a0, s0
				jal getpieceisdame
				bnez a0, drawdame
				drawnotdame:
					mv a0, s0
					jal getpieceteam
					bnez a0, drawcpunotdame
					drawplayernotdame:
						lw a0, playerpieceaddress
						mv a1, s1
						jal drawtile
						mv a0, a1
						jal movetoBG
						j enddrawpiece
					drawcpunotdame:
						lw a0, cpupieceaddress
						mv a1, s1
						jal drawtile
						mv a0, a1
						jal movetoBG
						j enddrawpiece
				drawdame:
					mv a0, s0
					jal getpieceteam
					bnez a0, drawcpudame
					drawplayerdame:
						lw a0, playerdameaddress
						mv a1, s1
						jal drawtile
						mv a0, a1
						jal movetoBG
						j enddrawpiece
					drawcpudame:
						lw a0, cpudameaddress
						mv a1, s1
						jal drawtile
						mv a0, a1
						jal movetoBG
						j enddrawpiece
				enddrawpiece:

				lw s0, 0(sp)
				lw a0, 4(sp)
				lw a1, 8(sp)
				lw ra, 12(sp)
				addi sp, sp, 16
				jalr zero, ra, 0

			getboarddrawaddress:
				addi sp, sp, -4
				sw ra, 0(sp)

				jal getpiecepos
				slli a1, a1, 3
				add a0, a1, a0
				la a1, boarddrawaddresses
				slli a0, a0, 2
				add a1, a0, a1
				lw a0, 0(a1)
				
				lw ra, 0(sp)
				addi sp, sp, 4
				jalr zero, ra, 0
			getboardfromxy:
				slli a1, a1, 3
				add a0, a1, a0
				la a1, boarddrawaddresses
				slli a0, a0, 2
				add a1, a0, a1
				lw a0, 0(a1)
				jalr zero, ra, 0

		###################################################
			
			MOVE_OBJECT:
				#############
				addi sp, sp, -96
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
					sw a0, 80(sp)
					sw a1, 84(sp)
					sw a2, 88(sp)
					sw a3, 92(sp)
				#############
				mv s0, a0
				mv s1, a1
				mv s3, a2 # address of position
				mv s4, a3 # address of graphical data
				jal getaddress
				mv s2, a0 # destination address
				
				move_loop:
				lw t1, 0(s3)
				mv t6, t1 # backup of original position
				beq t1, s2, endmove_loop
					mv a0, t1
					jal getcoordinates
					bgt a0,s0, greater_x
					blt a0,s0, lesser_x
					j move_y
					greater_x:
						addi a0, a0, -1
						j move_y
					lesser_x:
						addi a0, a0, 1
					move_y:
						bgt a1, s1, greater_y
						blt a1, s1, lesser_y
						j store_move_address
					greater_y:
						addi a1, a1, -1
						j store_move_address
					lesser_y:
						addi a1, a1, 1
					store_move_address:
						jal getaddress
						sw a0, 0(s3) #store new position
						#DRAW SHIT
						mv a0, t6 # recover original position
						#jal undrawtile
						lw a1, 0(s3) # position to draw
						lw a0, 0(s4) # address of graphics
						jal drawtile
						li a0, FRAMEWAIT
						li a7, 32 # sleep
						ecall
					j move_loop
				endmove_loop:
				##############
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
					lw a0, 80(sp)
					lw a1, 84(sp)
					lw a2, 88(sp)
					lw a3, 92(sp)
					addi sp, sp 96
				##############
				jalr zero, ra, 0

			MOVE_2OBJECTS:
				#############
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
				#############
				mv s0, a0 # x destination
				mv s1, a1 # y destination
				mv s3, a2 # address of position (cursor)
				mv s4, a3 # address of graphical data (cursor)
				mv s5, a4 # address of second object graphical data (piece)
				mv s6, a5 # address of position (piece)
				jal getaddress
				mv s2, a0 # destination address (cursor)
				
				move_loop2:
				lw t1, 0(s3)
				mv t6, t1 # backup of original position
				
				beq t1, s2, endmove_loop2
					mv a0, t1
					jal getcoordinates
					bgt a0,s0, greater_x2
					blt a0,s0, lesser_x2
					j move_y2
					greater_x2:
						addi a0, a0, -1
						j move_y2
					lesser_x2:
						addi a0, a0, 1
					move_y2:
						bgt a1, s1, greater_y2
						blt a1, s1, lesser_y2
						j store_move_address2
					greater_y2:
						addi a1, a1, -1
						j store_move_address2
					lesser_y2:
						addi a1, a1, 1
					store_move_address2:
						jal getaddress
						sw a0, 0(s3) #store new position (cursor)
						li t0, 3200 # cursor + 3200 downwards
						add t0, a0, t0
						sw t0, 0(s6) # store piece new position
						#DRAW SHIT
						mv a0, t6 # recover original position
						#jal undrawtile
						li a0, 3200
						add a0, t1, a0
						#jal undrawtile
						
						lw a1, 0(s6) # position to draw piece
						lw a0, 0(s5) # address of graphics piece
						jal drawtile
						
						
						lw a1, 0(s3) # position to draw cursor
						lw a0, 0(s4) # address of graphics cursor
						jal drawtile
						
						
						li a0, FRAMEWAIT
						li a7, 32 # sleep
						ecall
					j move_loop2
				endmove_loop2:
				##############
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
				##############
				jalr zero, ra, 0


			#CHECK KEYBOARD
			li t1,0xFF200000
			lw t0,0(t1)
			andi t0,t0,0x0001		# Le bit de Controle Teclado
				beq t0,zero,DRAW   	   	# Se n�o h� tecla pressionada PULA
				lw t2,4(t1)
				li t0, 97
				beq t2, t0, MOVE_LEFT
				li t0, 100
				beq t2, t0, MOVE_RIGHT
				j DRAW

				MOVE_LEFT:
					li a0, -8
					j MOVE_X
				MOVE_RIGHT:
					li a0, 8
				MOVE_X:
				la t0, testsprite_x
				lw t1, 0(t0)
				add t1, t1, a0
				sw t1, 0(t0)  	
				li t0, 1
				la t1, moved
				sw t0, 0(t1)		

			#MOVE Y 

			#DRAW

			DRAW:
			lw t0, moved
			#beqz t0, loop
			la t0, moved
			li t1, 0
			sw t1, 0(t0)
			
			
			lw a0, testsprite_x
			lw a1, testsprite_y
			jal getaddress
			mv a1, a0
			lw a0, testsprite_address
			jal drawtile
			
			li a0, 10
			li a7, 32
			ecall
			
			#j loop



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
				mv s1, a1 # save sprite palette mask
				
				 
				 lw s2, VRAMPOINTER
				 mv s11, s2 # the original VRAMPOINTER, will be the a0 output at the end 

				 #load colors on s7-s10
				 lw t2, COLOR_PALETTE #load color palette
				 and t2, t2, s1 	# apply sprite-specific mask
				 li t1, 0xC7C7C7C7 # load transparency
				 not t0, s1		#negate spprite mask
				 and t1, t1, t0 	# apply to transparency
				 or t2, t2, t1		# get result of palette + transparency 
				 srli s7, t2, 24	# color 00
				 srli s8, t2, 16	# color 01
				 srli s9, t2, 8		# color 10
				 add  s10, t2, zero # color 11, disregard the other bytes of the word

				 li t1, 0
				 li t0, 64 # number of bytes to read from sprite_address
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
					 		sb s7, 0(s2) # store pixel at VRAMPOINTER
					 		j uncompress_switchend 
					 	uncompress_switch01:
					 		sb s8, 0(s2) # store pixel at VRAMPOINTER
					 		j uncompress_switchend 
					 	uncompress_switch10:
					 		sb s9, 0(s2) # store pixel at VRAMPOINTER
					 		j uncompress_switchend 
					 	uncompress_switch11:
					 		sb s10, 0(s2) # store pixel at VRAMPOINTER
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


				li t0, 0
				li t1, 16
				mv s0, a0
				mv s1, a1
				drawtile_loop1:
					beq t0, t1, drawtile_loop1_end
					lw t2, 0(s0)
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					lw t2, 4(s0)
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					addi s0, s0, 8
					addi s1, s1, 313
					addi t0, t0, 1
					j drawtile_loop1
					
					gettransparencylayer:
						li t5, 0x000000FF
						and t5, t5, t2
						li t6, 0xC7
						beq t5, t6, istransparent
						jalr zero, ra,0
						istransparent:
						li t5, 0x00300000
						add t5, s1, t5
						lb t5, 0(t5)
						sb t5, 0(s1)
						jalr zero, ra, 4
						
				drawtile_loop1_end:
				addi s1, a1, 8
				addi s0, a0, 128
				li t0, 0
				li t1, 16
				drawtile_loop2:
					beq t0, t1, drawtile_loop2_end
					lw t2, 0(s0)
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					lw t2, 4(s0)
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					srli t2, t2, 8
					addi s1, s1, 1
					jal gettransparencylayer
					sb t2, 0(s1)
					addi s0, s0, 8
					addi s1, s1, 313
					addi t0, t0, 1
					j drawtile_loop2
				drawtile_loop2_end:

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
				jalr zero, ra, 0

			# the worst name in recent history
			# input: a0 address
			undrawtile:
				addi sp, sp, -28
					sw s0, 0(sp)
					sw s1, 4(sp)
					sw t0, 8(sp)
					sw t1, 12(sp)
					sw t2, 16(sp)
					sw t3, 20(sp)
					sw t4, 24(sp)
				
				mv s0, a0
				li s1, 0x00300000 #ff3000000
				add s1, a0, s1
				li t0, 0
				li t1, 16
				undraw_loop1:
					beq t0, t1 undraw_loop1_end
					li t2, 0
					li t3, 16
					undraw_loop2:
						beq t2, t3, undraw_loop2_end
						lb t4, 0(s1)
						sb t4, 0(s0)
						addi s1, s1, 1
						addi s0, s0, 1
						addi t2, t2, 1
						j undraw_loop2
						undraw_loop2_end:
						addi t0, t0, 1
						addi s1, s1, 304
						addi s0, s0, 304
						j undraw_loop1 
				undraw_loop1_end:
				
				
				lw s0, 0(sp)
					lw s1, 4(sp)
					lw t0, 8(sp)
					lw t1, 12(sp)
					lw t2, 16(sp)
					lw t3, 20(sp)
					lw t4, 24(sp)
					addi sp, sp, 28
					
				jalr zero, ra, 0

			movetoBG:
				addi sp, sp, -36
					sw s0, 0(sp)
					sw s1, 4(sp)
					sw t0, 8(sp)
					sw t1, 12(sp)
					sw t2, 16(sp)
					sw t3, 20(sp)
					sw t4, 24(sp)
					sw ra, 28(sp)
					sw t5, 32(sp)
				
				mv s0, a0
				li s1, 0x00300000 #ff3000000
				add s1, a0, s1
				li t0, 0
				li t1, 16
				li t5, 0xffffffC7
				movetoBG_loop1:
					beq t0, t1 movetoBG_loop1_end
					li t2, 0
					li t3, 16
					movetoBG_loop2:
						beq t2, t3, movetoBG_loop2_end
						lb t4, 0(s0)
						beq t4, t5, movetoBG_skiptransparency
						sb t4, 0(s1)
						movetoBG_skiptransparency:
						addi s1, s1, 1
						addi s0, s0, 1
						addi t2, t2, 1
						j movetoBG_loop2
						movetoBG_loop2_end:
						addi t0, t0, 1
						addi s1, s1, 304
						addi s0, s0, 304
						j movetoBG_loop1 
				movetoBG_loop1_end:
				jal undrawtile
				
				lw s0, 0(sp)
					lw s1, 4(sp)
					lw t0, 8(sp)
					lw t1, 12(sp)
					lw t2, 16(sp)
					lw t3, 20(sp)
					lw t4, 24(sp)
					lw ra, 28(sp)
					lw t5, 32(sp)
					addi sp, sp, 36
					
				jalr zero, ra, 0

			removefromBG1:
				addi sp, sp, -32
					sw s0, 0(sp)
					sw s1, 4(sp)
					sw t0, 8(sp)
					sw t1, 12(sp)
					sw t2, 16(sp)
					sw t3, 20(sp)
					sw t4, 24(sp)
					sw s2, 28(sp)
				
				mv s0, a0
				li s1, 0x00300000 #ff3000000
				add s1, a0, s1
				li s2, 0x0010000
				add s2, s1, s2
				li t0, 0
				li t1, 16
				removefromBG_loop1:
					beq t0, t1 removefromBG_loop1_end
					li t2, 0
					li t3, 16
					removefromBG_loop2:
						beq t2, t3, removefromBG_loop2_end
						lb t4, 0(s1)
						sb t4, 0(s0)
						lb t4, 0(s2)
						sb t4, 0(s1)
						addi s1, s1, 1
						addi s2, s2, 1
						addi s0, s0, 1
						addi t2, t2, 1
						j removefromBG_loop2
						removefromBG_loop2_end:
						addi t0, t0, 1
						addi s1, s1, 304
						addi s0, s0, 304
						addi s2, s2, 304
						j removefromBG_loop1 
				removefromBG_loop1_end:
				
				lw s0, 0(sp)
					lw s1, 4(sp)
					lw t0, 8(sp)
					lw t1, 12(sp)
					lw t2, 16(sp)
					lw t3, 20(sp)
					lw t4, 24(sp)
					lw s2, 28(sp)
					addi sp, sp, 32
					
				jalr zero, ra, 0

				
			#input: a0 (address)
			#output: a0 (x)
			#	 a1 (y)
			getcoordinates:
				addi sp, sp, -12
				sw t0, 0(sp)
				sw t1, 4(sp)
				sw t2, 8(sp)
				li t0, 0x0001FFFF #mask relevant bits
				and a0, a0, t0
				li t0, 320
				div t1, a0, t0
				rem t2, a0, t0
				mv a1, t1
				mv a0, t2
				lw t0, 0(sp)
				lw t1, 4(sp)
				lw t2, 8(sp)
				addi sp, sp, 12
				jr ra


			#input: a0 (x)
			#	 a1 (y)
			#output: ao (address)
			getaddress:
				addi sp, sp, -4
				sw t0, 0(sp)
				li t0, 320
				mul a1, a1, t0
				add a1, a1, a0
				mv a0, a1
				li t0, 0xff000000
				add a0, a0, t0
				lw t0, 0(sp)
				addi sp, sp, 4
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
				
			rainbowcls:
				li t0, 0x070707
				li t1, 0x383838
				li t2, 0xC0C0C0
				li t3, 0xFFFFFF
				li t4, 19200
				li t5, 0
				mv t6, a0
				rainbowloop:
					beq t5, t4, rainbowloop_end
					sw t0, 0(t6)
					sw t1, 4(t6)
					sw t2, 8(t6)
					sw t3, 12(t6)
					addi t6, t6, 16
					addi t5, t5, 1
					j rainbowloop
					rainbowloop_end:
					jalr zero,ra,0



			EXIT:
				li a7, 10
				ecall
