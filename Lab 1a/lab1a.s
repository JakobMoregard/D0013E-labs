# Assignment: extend this program to reverse the string "intext"
# and write the result to "outtext".	

            .text
            .set noreorder
main:      	la    	$t1, intext		# t1 points to start of intext
           	la    	$t2, outtext		# t2 points to start of outtext
           	li    	$t0, 0			# t0 used to count characers

seek_end:	lb    	$t3, 0($t1)		# read character
            	beq   	$t3, 0, seek_end1 	# check if 0 (end of string)
            	addiu 	$t0, $t0, 1
            	addiu 	$t1, $t1, 1
            	b     	seek_end

seek_end1:  	addu  	$t2, $t2, $t0		# t2 points to end of outtext
            	sb    	$t3, 0($t2)		# write 0 to terminate string
            	la    	$t1, intext		# t1 points to start of intext

		addiu	$t2, $t2, -1
		or	$a2, $t2, $zero		#points to destination
		or	$a1, $t1, $zero		#points to source	
		or	$a0, $t0, $zero		#num of chars
		bal 	rev			#branch and link to rev

		
stop:		b     stop			#stop the program

				
rev:		addiu	$sp, $sp, -4		# push the return addr...
     		sw    	$31, 0($sp)		# ...onto the stack.
		addiu 	$sp, $sp, -4 		# push the old frame pointer addr..
		sw    	$fp, 0($sp)		# ...onto the stack
		move  	$fp, $sp		# establish new frame pointer.
		addiu 	$sp, $sp, -12		# make room for 3 params


save:		sw	$a0, -4($fp)		#store num of char param
		sw	$a1, -8($fp)		#store char source param
		sw	$a2, -12($fp)		#store char destination param

#

if:		bgtz 	$a0, else		#if there is no character left... 

then:		b 	exit			#...then branch to exit


else:		addiu	$a0, $a0, -1		#adjust num of chars
		addiu	$a1, $a1, 1		#adjust char source param
		addiu	$a2, $a2, -1		#adjust char destination param

		bal	rev			#recursion call

		lw	$t1, -8($fp)		#load addr to char in source
		lw	$t2, -12($fp)		#load addr to char destination
		lb	$t3, 0($t1)		#load char(byte) at source addr
		sb	$t3, 0($t2)		#store char(byte) at dest addr

		
		

exit:		move  $sp, $fp		# destroy all local param
      		lw    $fp, 0($sp)	# restore old $fp
       		addiu $sp, $sp, 4	# and pop that word,
       		lw    $31, 0($sp)	# restore return address,
       		addiu $sp, $sp, 4	# and pop that word.
       		jr    $31		# return
 
   #    +-------------------+
   #    | char dest. param  | -12($fp)
   #    +-------------------+
   #    | char source param | -8($fp)
   #    +-------------------+
   #    | num of char param | -4($fp)
   #    +-------------------+
   #    | old frame pointer |  0($fp)
   #    +-------------------+
   #    |  our return addr  |  4($fp)
   #  --+-------------------+--
   #    |                   |
   #    |  caller's stack   |
   #    |                   |
   #

            .data
intext:		.string "!dlroW olleH"
            .align 4
outtext:	.string "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

