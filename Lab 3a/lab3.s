# First section:  user data,
# each process has its own "private" area.

        .data        
glob1:  .byte   'A'
        .space  999
glob2:  .byte   '0'
        .space  999
glob3:  .byte   'a'
        .space  999

# Second section: user code.
#
# The first instructions initializes IO and Timer.
# The last instruction in main are only used for start
# up, they initialize the first process.

        .text
        .set noreorder
main:
        li    	$t0, 0xFFFF0010   # address to Timer registers:
                                # +0: Timer control register
                                # +4: Timer count register
                                # +8: Timer compare register

        li    	$t1, 0
        sw    	$t1, 4($t0)       # reset counter register

        li    	$t1, 63           # count from 0 to 63
        sw    	$t1, 8($t0)       # compare register := 63

        li    	$t1, 0b101001     # "101001": compare interrupt enable,
                                #           compare reset enable,
                                #           timer start
        sw    	$t1, 0($t0)       # control register := "101001"

        li    	$t0, 0xFFFF0000   # address to I/O registers:
                                # +0: Input control register
 
        li    	$t1, 0b10         # "10": interrupt enable
        sw    	$t1, 0($t0)       # control register := "10"

        li    	$t0, 0x0003       # enable HW Interrupt 1 (input): bit 11
                                # enable HW Interrupt 0 (timer): bit 10
                                # set user mode:     bit 1
                                # enable interrupts: bit 0

        mtc0	$t0, $12          # CP0 status := 0x0C03

        la  	$gp, glob1        # dirty setup for process 1

proc1:  # ++++++++++ first process +++++++++

        # Description: proc1 reads the byte stored at 0($gp),
        # prints it, increments to the next character,
        # saving that back into 0($gp).  After printing 'Z',
        # this process should then start over again with 'A', in
        # an endless loop.  The symbol "glob1" may not be used.	


	lb	$a0, 0($gp)
	li	$v0, 0x102
	syscall
	nop
	
	li	$t0, 0x5a
	bne	$a0, $t0, reset1
	nop

	li	$a0, 0x40

reset1:	addiu	$a0, $a0, 1
	sb	$a0, 0($gp)

	j	proc1
	nop	

#	addiu	$t0, $zero, 26		#initalize branch comparator
#
#loop:	lb	$a0, 0($gp)		#load char byte
#	or 	$v0, $zero, 0x102	#specify output service
#	syscall				
#	nop
#
#	addiu	$t2, $t2, 1		#loopcounter
#	addiu	$a0, $a0, 1		#next char byte	
#	sb	$a0, 0($gp)		#stores next byte into gp
#	bne	$t0, $t2, loop		#branches if t0 != 26
#	nop
#
#	addiu	$a0, $a0, -26		#resets char byte to A
#	sb	$a0, 0($gp)		#stores that byte at gp
#	or	$t2, $zero, $zero	#resets loopcounter
#   	j 	proc1			#jumps to subroutine start
#    	nop


proc2: # ++++++++++ second process +++++++++

        # Description: almost identical to the code of proc1 above,
        # only 2-3 lines should differ.  Prints '0' through '9' in
        # an endless loop. The symbol "glob2" may not be used.

        j 	proc2
        nop


proc3:  # +++++++++ third process ++++++++++

        # Description: almost identical to the code of proc1 above,
        # only 2-3 lines should differ.  Prints 'a' through 'z' in
        # an endless loop. The symbol "glob3" may not be used.

        j 	proc3
        nop

# Third section: data structures for the kernel:
# Process Control Block (PCB) consists of three words:
# pcb: .word  (next Program Counter for this process)
#      .word  (contents of $gp for this process)
#      .word  (contents of $sp for this process)
# All other context is saved on the process' own stack
# during exception handling and SYSCALL.

        .section .kdata
curpcb: .word  pcb1
pcb1:   .word  0, 0, 0
pcb2:   .word  proc2, glob2, 0x7fffbf94
pcb3:   .word  proc3, glob3, 0x7fff7f94

# Fourth section: kernel code.

        .section .ktext , "xa"
        .set noreorder
	
	mfc0	$k0, $13		#loads Exception Program Counter
	nop
	
	sll	$k0, $k0, 25		#removes bits 31:6
	srl 	$k0, $k0, 27		#removes bits 1:0
	ori	$k1, $zero, 8		#initalize comparator
	bne	$k0, $k1, kernel_loop	#branch if k0 != 8
	nop
	
	ori	$k1, $zero, 0x102	#initalize comparator
	bne	$v0, $k1, return	#branch if v0 != 0x102
	nop

	lui	$k0, 0xffff		#loads 0xffff...
	ori	$k0, 0x0000		#and 0x0000 into k0
	sb	$a0, 8($k0)		#write char byte to addr

return:	mfc0	$k0, $14		#loads EPC register
	nop
	addiu	$k0, $k0, 4		#one instruction after syscall
	jr	$k0			#jumps to that instruction
	rfe				#switch to user mode


kernel_loop:
        b 	kernel_loop		#infinite kernel loop
        nop
