#Author Jakob Moregård and Mattias Nilsson
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

        li    	$t0, 0x0C03       # enable HW Interrupt 1 (input): bit 11
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


	lb	$a0, 0($gp)		#loads byte at gp
	li	$v0, 0x102		#specify output
	syscall
	nop
	
	li	$t0, 0x5a		#sets t0 to 'Z'
	bne	$a0, $t0, reset1	#branch if a0 char != 'Z'
	nop

	ori	$a0, $zero, 0x40	#sets a0 to ASCII 'A'-1

reset1:	nop
	addiu	$a0, $a0, 1		#next char
	nop
	nop
	j	proc1
	sb	$a0, 0($gp)		#stores byte at gp


proc2: # ++++++++++ second process +++++++++

        # Description: almost identical to the code of proc1 above,
        # only 2-3 lines should differ.  Prints '0' through '9' in
        # an endless loop. The symbol "glob2" may not be used.


	lb	$a0, 0($gp)		#loads byte at gp
	li	$v0, 0x102		#specify output
	syscall
	nop
	
	li	$t0, 0x39		#sets t0 to '9'
	bne	$a0, $t0, reset2	#branch if a0 char != '9'
	nop

	li	$a0, 0x2f		#sets a0 to ASCII '0'-1

reset2:	nop
	addiu	$a0, $a0, 1		#next char
	nop
	nop
	j	proc2
	sb	$a0, 0($gp)		#stores byte at gp


proc3:  # +++++++++ third process ++++++++++

        # Description: almost identical to the code of proc1 above,
        # only 2-3 lines should differ.  Prints 'a' through 'z' in
        # an endless loop. The symbol "glob3" may not be used.

	
	lb	$a0, 0($gp)		#loads byte at gp
	li	$v0, 0x102		#specify output
	syscall
	nop
	
	li	$t0, 0x7a		#sets t0 to 'z'
	bne	$a0, $t0, reset3	#branch if a0 char != 'z'
	nop

	li	$a0, 0x60		#sets a0 to ASCII 'a'-1

reset3:	nop
	addiu	$a0, $a0, 1		#next char
	nop
	nop
	j	proc3
	sb	$a0, 0($gp)		#stores byte at gp


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

kernel:	
	mfc0	$k0, $13		#loads Exception Program Counter
	nop
	
	sll	$k1, $k0, 25		#removes bits 31:6
	srl 	$k1, $k1, 27		#removes bits 1:0

	bne	$k1, $zero, output	#branch if not timer interrupt
	nop
	
	sll	$k1, $k0, 15		#removes bits 31:16
	srl 	$k1, $k1, 25		#removes bits 9:0

	ori	$k0, $zero, 2
	beq	$k1, $k0, kernel_loop	#if input interrupt, freeze program
	nop

	ori	$k0, $zero, 1
	bne	$k1, $k0, kernel_loop	#if not timer interrupt, freeze program
	nop

interrupt_reset:	
	li      $k0, 0xFFFF0010
	li      $k1, 0b101001
	sw      $k1, 0($k0)

store_pcb:
	la	$k0, curpcb		#loads curpcb
	lw 	$k1, 0($k0)		#loads pcb at curpcb

	mfc0	$k0, $14		#loads EPC register
	nop
	sw	$k0, 0($k1) 		#stores pc	
	sw	$gp, 4($k1)		#stores gp
	sw	$sp, 8($k1)		#stores sp
	addiu 	$sp, $sp, -108		# make room for 27 params

	
store_registers:			#store all the registers 
	sw	$fp, 104($fp)
	sw	$ra, 100($fp)

	sw	$t0, 96($sp)
	sw	$t1, 92($sp)
	sw	$t2, 88($sp)
	sw	$t3, 84($sp)
	sw	$t4, 80($sp)
	sw	$t5, 76($sp)
	sw	$t6, 72($sp)
	sw	$t7, 68($sp)
	sw	$t8, 64($sp)
	sw	$t9, 60($sp)

	sw	$s0, 56($sp)
	sw	$s1, 52($sp)
	sw	$s2, 48($sp)
	sw	$s3, 44($sp)
	sw	$s4, 40($sp)
	sw	$s5, 36($sp)
	sw	$s6, 32($sp)
	sw	$s7, 28($sp)

	sw	$a0, 24($sp)
	sw	$a1, 20($sp)
	sw	$a2, 16($sp)
	sw	$a3, 12($sp)

	sw	$v0, 8($sp)
	sw	$v1, 4($sp)

	.set noat
    	sw $at, 0($sp)
    	.set at


pcb_check: 
	la 	$k0, curpcb		#loads curpcb addr
	lw	$k1, 0($k0)		#loads pcb at curpcb

if_pcb1:
	la	$k0, pcb1		
	beq	$k0, $k1, nextpcb2	#branch if curpcb == pcb1
	nop

if_pcb2:
	la	$k0, pcb2
	beq	$k0, $k1, nextpcb3	#branch if curpcb == pcb2
	nop
	
if_pcb3:
	la	$k0, pcb3
	beq	$k0, $k1, nextpcb1	#branch if curpcb == pcb3
	nop
	
nextpcb2:	
	la	$k1, curpcb		#if curpcb == pcb1...
	la	$k0, pcb2		#...load pcb2... 
	sw	$k0, 0($k1)		#into curpcb
	b	nextpcb
	nop

nextpcb3:
	la	$k1, curpcb		#if curpcb == pcb2...
	la	$k0, pcb3		#...load pcb3...
	sw	$k0, 0($k1)		#into curpcb
	b	nextpcb
	nop
	
nextpcb1:
	la	$k1, curpcb		#if curpcb == pcb3...
	la	$k0, pcb1		#...load pcb1...
	sw	$k0, 0($k1)		#into curpcb
	b	nextpcb
	nop
	
nextpcb:
	lw	$sp, 8($k0)		#loads next sp	
	nop
	addiu	$sp, $sp, -108		#moves sp
	lw	$gp, 4($k0)		#loads next gp

	
load_registers:				#load all the registers
	lw	$fp, 104($sp)
	lw	$ra, 100($sp)
	lw	$t0, 96($sp)
	lw	$t1, 92($sp)
	lw	$t2, 88($sp)
	lw	$t3, 84($sp)
	lw	$t4, 80($sp)
	lw	$t5, 76($sp)
	lw	$t6, 72($sp)
	lw	$t7, 68($sp)
	lw	$t8, 64($sp)
	lw	$t9, 60($sp)

	lw	$s0, 56($sp)
	lw	$s1, 52($sp)
	lw	$s2, 48($sp)
	lw	$s3, 44($sp)
	lw	$s4, 40($sp)
	lw	$s5, 36($sp)
	lw	$s6, 32($sp)
	lw	$s7, 28($sp)

	lw	$a0, 24($sp)
	lw	$a1, 20($sp)
	lw	$a2, 16($sp)
	lw	$a3, 12($sp)

	lw	$v0, 8($sp)
	lw	$v1, 4($sp)

	.set noat
    	lw $at, 0($sp)
    	.set at


return1:
	lw	$k1, 0($k0)		#loads next pc
	nop
	jr	$k1			#jumps to that pc
	rfe


output:	ori	$k0, $zero, 8		#initalize comparator
	bne	$k1, $k0, kernel_loop	#branch if k0 != 8
	nop
	
	ori	$k1, $zero, 0x102	#initalize comparator
	bne	$v0, $k1, return2	#branch if v0 != 0x102
	nop

	lui	$k0, 0xffff		#loads 0xffff...
	ori	$k0, 0x0000		#and 0x0000 into k0
	sb	$a0, 8($k0)		#write char byte to addr

return2:
	mfc0	$k0, $14		#loads EPC register
	nop
	addiu	$k0, $k0, 4		#one instruction after syscall
	jr	$k0			#jumps to that instruction
	rfe				#switch to user mode


kernel_loop:
        b 	kernel_loop		#infinite kernel loop
        nop
