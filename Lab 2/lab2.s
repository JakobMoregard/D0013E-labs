# ----------------------------------------------------------
#  Group 57's "underlag" for Lab 1
#  Pseudo-instructions may be used for Lab 1.
# ----------------------------------------------------------
 
 
 
# Group 57's Codeword Generator Subroutine (pseudocode)
#  (remember:  "seed" is a global variable, UNSIGNED INTEGER;
#              you may implement local variables in registers or on the stack;
#              result returned in v0; preserve all except t regs)
#
# FUNCTION codgen(): UNSIGNED INTEGER;
#  LOCAL SIGNED INTEGER   n;
#  LOCAL UNSIGNED INTEGER x, y;
#  BEGIN
#    n := [right-justify the five bits "seed"<29:25>, and zero-extend];
#   WHILE (n >= 0) LOOP
#    x := [shift "seed" left-logical by 2 bits];
#    y := [shift "seed" right-LOGICAL by 2 bits];
#    seed := x - y;  [ignore overflow condition]
#    n  :=  n - 1;
#   ENDLOOP;
#   RETURN( seed XOR 0x7bd9f87d );
#  END;
# 
# hint:  if "seed" is initialized to 0x13331372,
#        the first five calls will generate these values:
#        0x8852de4c, 0xc25a4788, 0xfbf7ee09, 0x9b752c4e, 0x05cf164f, ...
# your code is to be written farther down (see comment below).
 
 
# Group 57's Recursive Decoding Subroutine (pseudocode)
#  (for "decode", all four local variables must be implemented ON THE
#              STACK, and NOT in registers; implement the code literally,.
#              no optimizations.  We're trying to teach you something.
#   remember:  result returned in v0; preserve all except t regs)
#
# FUNCTION decode( wordarr, bytearr ): UNSIGNED INTEGER;
#    (wordarr, bytearr passed by reference)
#  LOCAL UNSIGNED INTEGER m, r, x, y;
#  BEGIN
#    x := ONE'S-COMPLEMENT of codgen();
#    IF ([contents of word at "wordarr"] = 0) THEN  
#      [byte pointed to by "bytearr"] := 0;
#      r := x;
#    ELSE
#      y := decode( wordarr+, bytearr+ );  # "k+" means "successor in k"
#      m := ( x XOR y ) - [contents of word at "wordarr"];
#      [byte pointed to by "bytearr"] := [the eight bits at "m"<26:19>];
#      r := TWO'S-COMPLEMENT OF codgen();
#      r := x + y + m + r + 5;
#    ENDIF;
#    RETURN( r );
#  END;
 
 
# ----------------------------------------------------------
# The following are the ONLY lines that may appear in the
# ".data" section of the code.  You may add NO other lines.
# NO additional global variables.
# ----------------------------------------------------------
 
 
	.data
plain:	.space	77		# room for 77 characters
 
	.align 4
seed:	.word    0			# 32-bit UNSIGNED INTEGER.
 
abc:	.word	0x04abc806	# string "abc", encoded
	.word	0x0d8c58cf
	.word	0xc8abf379
	.word	    0
coded:	.word	0xbff0eb3f	# the real encoded data
	.word	0x2367484d
	.word	0x76ad79bc
	.word	0x62cd3fdb
	.word	0xd7c3959b
	.word	0x237232fe
	.word	0x170db5f1
	.word	0x66aeaf1b
	.word	0xcfef7613
	.word	0x605f4e1b
	.word	0xf32c16a7
	.word	0xae0fdc87
	.word	0xa555ebd6
	.word	0x9dacf320
	.word	0xa6fd4c24
	.word	0xfaf0db8e
	.word	0x052c1055
	.word	0x2016fc1a
	.word	0xf458f1e3
	.word	0x76274c7a
	.word	0xf8db5eaa
	.word	0x08735413
	.word	0x46f9a26d
	.word	0x4d4bc9d3
	.word	0x55ce9d32
	.word	0x9d52a6b4
	.word	0x274490ed
	.word	0xd393f58f
	.word	0x66d50879
	.word	0x673a3a95
	.word	0x7c36b5d6
	.word	0x89b9c1d2
	.word	0x52668354
	.word	0x8e965cfc
	.word	0x6466ec1b
	.word	0xed8928c5
	.word	0x639ea4c5
	.word	0xcb596e67
	.word	0xb8286b71
	.word	0x08951897
	.word	0x7a90b9bb
	.word	0x92becb53
	.word	0x7ecee629
	.word	0x4878995b
	.word	0x7fb21436
	.word	0x5dcfa3de
	.word	0x7ee21bd7
	.word	0x3b51148e
	.word	0xebca9417
	.word	0x6904e842
	.word	0x3b1b5bdb
	.word	0xab1bbe08
	.word	0x24fb2862
	.word	0x11645ea5
	.word	0x9aa9cdcc
	.word	0x4118c7eb
	.word	0xecdd6187
	.word	0x13642c8c
	.word	0x2db4d064
	.word	0xe1157c37
	.word	0x51d4c29f
	.word	0xf75cdbc0
	.word	0x17b954a3
	.word	0x2694e581
	.word	0xf8ecec6c
	.word	0x92a61c75
	.word	0x8d3d27b7
	.word	0x79f766be
	.word	0x69a0676f
	.word	0x94b14d99
	.word	0x7c2eece9
	.word	0xd43eb476
	.word	0xcf58cc1e
	.word	0x5d962324
	.word	0xf5ab4049
	.word	0xe813fe90
	.word	    0
 
 
# ----------------------------------------------------------
# The following is the main program.  You may not change this.
# You may only add your subroutines AFTER the "infinite end loop" instruction here.
# You MUST have two subroutines named "codgen" and "decode".
# BOTH must adhere to our calling conventions; 
# both MUST preserve all registers except v-regs and t-regs;
# we are going to TEST for this when we run your code.
# ----------------------------------------------------------
 
 
	.text
	.set noreorder
main:		li	$s0, 0x5ef3afd3	# initialize "seed"
		la	$s1, seed	# initialize "seed"
		sw	$s0, 0($s1)
		la	$a0, coded	# address of start of coded words
		la	$a1, plain	# address of start of decoded bytes
		bal	decode		# outer call to recursive "decode"
		nop

end:		b       end             # infinite loop; plaintext now in "plain".
		nop
 
 
# ----------------------------------------------------------
# Group 57's assembly code for Function CodGen :
# ----------------------------------------------------------

   		
   		#    +-------------------+
   		#    | old frame pointer |  0($fp)
   		#    +-------------------+
   		#    |  our return addr  |  4($fp)
   		#  --+-------------------+--
   		#    |                   |
   		#    |  caller's stack   |
   		#    |                   |


codgen:		addiu	$sp, $sp, -4		# push the return addr...
     		sw    	$31, 0($sp)		# ...onto the stack.
		addiu 	$sp, $sp, -4 		# push the old frame pointer addr..
		sw    	$fp, 0($sp)		# ...onto the stack

		lw	$t0, 0($s1)		#load "seed" to $t0 in advance

		move  	$fp, $sp		# establish new frame pointer.


		sll 	$t1, $t0, 2		#remove bits 31:30 from "seed"
		srl 	$t1, $t1, 27		#right align original bits 29:25
		
loop:		sll 	$t2, $t0, 2		#left-shift "seed" 2 bits (x)
		srl 	$t3, $t0, 2		#Right-shift "seed" 2 bits (y)
		addiu	$t1, $t1, -1		#n-1
		bgez	$t1, loop		#loop condition
		subu	$t0, $t2, $t3		#x-y and saves in "seed"


save:		lui	$t4, 0x7bd9		#initialize 0x7bd9f87d
		ori	$t4, $t4, 0xf87d	#  --------||--------
		xor	$v0, $t0, $t4		#returns new "seed" with xor


exit:		move 	$sp, $fp		# destroy all local param
      		lw    	$fp, 0($sp)		# restore old $fp
       		addiu 	$sp, $sp, 4		# and pop that word,
       		lw    	$31, 0($sp)		# restore return address

		sw	$t0, 0($s1)		#stores new "seed"

       		jr    	$31			# return	
		addiu 	$sp, $sp, 4		# pops word.		
	



# ----------------------------------------------------------
# Group 57's assembly code for Function DeCode :
# ----------------------------------------------------------


		#    +-------------------+
   		#    | 	       m         | -24($fp)	<== $sp points here
		#    +-------------------+
   		#    | 	       y         | -20($fp)
		#    +-------------------+
   		#    | 	       r         | -16($fp)
	   	#    +-------------------+
   		#    | 	       x         | -12($fp)
   		#    +-------------------+
   		#    |      bytearr      | -8($fp)
   		#    +-------------------+
   		#    |      wordarr      | -4($fp)
   		#    +-------------------+
   		#    | old frame pointer |  0($fp)
   		#    +-------------------+
   		#    |  our return addr  |  4($fp)
   		#  --+-------------------+--
   		#    |                   |
   		#    |  caller's stack   |
   		#    |                   |


decode:		addiu	$sp, $sp, -4		# push the return addr...
     		sw    	$31, 0($sp)		# ...onto the stack.
		addiu 	$sp, $sp, -4 		# push the old frame pointer addr..
		sw    	$fp, 0($sp)		# ...onto the stack
		move  	$fp, $sp		# establish new frame pointer.
		addiu 	$sp, $sp, -24		# make room for 6 params

		sw	$a0, -4($fp)		#wordarr
		bal 	codgen			#calls codgen
		sw	$a1, -8($fp)		#bytearr

		or	$t0, $v0, $zero		#saves codgen return in register
		lw	$t1, 0($a0)
		nor	$t0, $t0, $zero		#ONE'S-COMPLIMENT of codgen


if:		bne	$t1, $zero, else
		sw	$t0, -12($fp)		#store x in stack

then:		sb	$zero, 0($a1)		#store byte 0 in bytearr
		sw	$t0, -16($fp)		#store r (r = x)
	
		b	exit2			#branch to exit2
		addiu	$t5, $t0, 0		#loads r into the register used later in returning r
 		


else:		addiu	$a0, $a0, 4		#successor in wordarr
		bal 	decode			#recursive call
		addiu	$a1, $a1, 1		#successor in bytearr

		or	$t2, $v0, $zero		#loads return result into register
		sw	$t2, -20($fp)		#store y in stack

		lw	$t1, -4($fp)		#loads wordarr addr
		lw	$t0, -12($fp)		#loads x
		lw	$t1, 0($t1)		#loads content at wordarr

		xor	$t4, $t0, $t2		#x xor y
		subu	$t4, $t4, $t1		#-content of wordarr word
		sw	$t4, -24($fp)		#store m in stack

		lw	$t6, -8($fp)		#loads bytearr addr
		srl	$t5, $t4, 19		#shave of bits 18:0

		bal	codgen			#calls codgen method
		sb	$t5, 0($t6)		#store byte in bytearr
		or	$t5, $v0, $zero

		nor	$t5, $t5, $zero		#one's-compliment
		addiu	$t5, $t5, 1		#two's-compliment
		sw	$t5, -16($fp)		#store r in stack


		lw	$t0, -12($fp)		#load x
		lw	$t2, -20($fp)		#load y
		lw	$t4, -24($fp)		#load m

		addiu	$t5, $t5, 5		#x + y + m + (r + 5)
		addu	$t5, $t5, $t4		#x + y + (m + (r + 5))
		addu	$t5, $t5, $t2		#x + (y + (m + (r + 5)))
		addu	$t5, $t5, $t0		#(x + (y + (m + (r + 5))))
		sw	$t5, -16($fp)		#stores r in stack
		
		
exit2:		move 	$sp, $fp		# destroy all local param
      		lw    	$fp, 0($sp)		# restore old $fp
       		addiu 	$sp, $sp, 4		# and pop that word,
       		lw    	$31, 0($sp)		# restore return address

		addiu	$v0, $t5, 0		# return r 

       		jr    	$31			# return
		addiu 	$sp, $sp, 4		# pops word.
				

#number of cycles no-pipe 19532				
#number of cycles piped 19533	

#	                              (cycles in no-pipe mode)
#	         SPEED-UP  =  4  *   --------------------------
#	                             (cycles in pipelined mode)

#result: 4.000 (3.99994, rounded out to 3 decimal points is 4.000) difference in cycles comes from nop instructions in main.


#number of cycles piped with timer interrupts: 19759
#~200 cycles are added because the interupt subroutine runs 10 lines every ~1000 cycles and the entire program takes ~20000 cycles: 10 * 20 = 200.


#number of cycles piped with timer and input interrupts: 19759 + (~10 per inputted character, ie input 3 characters -> ~19790 cycles)
#the interup subroutine, which is 10 lines, runs everytime something is inputted in the text window: numOfInput * 10

		
# end of file.
