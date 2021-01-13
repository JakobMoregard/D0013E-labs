	.section .mdebug.abi32
	.previous
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.globl	coded
	.section	.data,"aw",@progbits
	.align	2
	.type	coded, @object
	.size	coded, 344
coded:
	.word	1470781325
	.word	1542075868
	.word	-89295372
	.word	-1749154762
	.word	-933511088
	.word	54988331
	.word	760068095
	.word	-853622400
	.word	1370425635
	.word	983686524
	.word	-1680772781
	.word	1190202440
	.word	1534614427
	.word	1280042460
	.word	-1476417952
	.word	-1600452290
	.word	-1474015580
	.word	-1292458392
	.word	-402279736
	.word	-356026578
	.word	1196058416
	.word	1590903092
	.word	-1901053112
	.word	2105829835
	.word	1184995768
	.word	-1210562791
	.word	-490157368
	.word	-1348719249
	.word	350124092
	.word	2072867617
	.word	-27087144
	.word	1199843823
	.word	953730597
	.word	-1887458067
	.word	1310737619
	.word	1445482819
	.word	-981353899
	.word	696882325
	.word	-1262188025
	.word	247316503
	.word	1677399517
	.word	-635590262
	.word	-1338795479
	.word	-1086993270
	.word	608556293
	.word	327535702
	.word	1091889157
	.word	-748223326
	.word	-1768009059
	.word	-61474750
	.word	-739355794
	.word	-728567316
	.word	401410338
	.word	-931828834
	.word	1475378534
	.word	1280341164
	.word	-1682482050
	.word	980345562
	.word	-59265222
	.word	-1211940787
	.word	-430439334
	.word	363975603
	.word	520212810
	.word	1839274033
	.word	-1333063730
	.word	-103412653
	.word	-1655104502
	.word	-1827713059
	.word	-954000181
	.word	-433588717
	.word	-1398290191
	.word	1046860097
	.word	2031107771
	.word	-1763758037
	.word	1292956205
	.word	-2034725979
	.word	-985910985
	.word	945208012
	.word	1283798403
	.word	1229352812
	.word	119577647
	.word	-1782712776
	.word	299745007
	.word	-1279763508
	.word	1726330775
	.word	0
	.section	.text.codgen,"ax",@progbits
	.align	2
	.globl	codgen
.LFB0:
	.file 1 "lab4.c"
	.loc 1 40 0
	.set	nomips16
	.ent	codgen
codgen:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	.loc 1 44 0
	lw	$6,0($4)
	nop
	sra	$2,$6,25
	andi	$5,$2,0x1f
	.loc 1 51 0
	bltz	$5,.L6
	nop

.L4:
	.loc 1 48 0
	srl	$3,$6,7
	.loc 1 47 0
	sll	$7,$6,1
	.loc 1 51 0
	addiu	$5,$5,-1
	.loc 1 50 0
	.loc 1 51 0
	bgez	$5,.L4
	xor	$6,$7,$3

	sw	$6,0($4)
.L6:
	.loc 1 54 0
	li	$5,1238564864			# 0x49d30000
	ori	$4,$5,0x8788
	.loc 1 55 0
	j	$31
	xor	$2,$6,$4

	.set	macro
	.set	reorder
	.end	codgen
.LFE0:
	.size	codgen, .-codgen
	.section	.text.decode,"ax",@progbits
	.align	2
	.globl	decode
.LFB1:
	.loc 1 57 0
	.set	nomips16
	.ent	decode
decode:
	.frame	$sp,40,$31		# vars= 0, regs= 5/0, args= 16, gp= 0
	.mask	0x800f0000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
.LCFI0:
	sw	$19,28($sp)
.LCFI1:
	sw	$18,24($sp)
.LCFI2:
	sw	$16,16($sp)
.LCFI3:
	sw	$31,32($sp)
.LCFI4:
	sw	$17,20($sp)
.LCFI5:
.LBB2:
.LBB3:
	.loc 1 44 0
	lw	$3,0($6)
.LBE3:
.LBE2:
	.loc 1 57 0
	move	$16,$6
.LBB4:
.LBB5:
	.loc 1 44 0
	sra	$2,$3,25
	andi	$6,$2,0x1f
.LBE5:
.LBE4:
	.loc 1 57 0
	move	$18,$4
.LBB6:
.LBB7:
	.loc 1 51 0
	bltz	$6,.L27
	move	$19,$5

	move	$4,$3
.L14:
	.loc 1 48 0
	srl	$3,$4,7
	.loc 1 47 0
	sll	$5,$4,1
	.loc 1 50 0
	xor	$4,$5,$3
	.loc 1 51 0
	addiu	$6,$6,-1
	.loc 1 50 0
	.loc 1 51 0
	bgez	$6,.L14
	sw	$4,0($16)

	.loc 1 52 0
	li	$9,1238564864			# 0x49d30000
.L32:
	ori	$8,$9,0x8788
.LBE7:
.LBE6:
	.loc 1 62 0
	lw	$6,0($18)
.LBB8:
.LBB9:
	.loc 1 52 0
	xor	$7,$4,$8
.LBE9:
.LBE8:
	.loc 1 40 0
	.loc 1 62 0
	bne	$6,$0,.L16
	nor	$17,$0,$7

	.loc 1 64 0
	move	$2,$17
	.loc 1 63 0
	sb	$0,0($19)
	.loc 1 74 0
	lw	$31,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	j	$31
	addiu	$sp,$sp,40

.L16:
	.loc 1 66 0
	addiu	$4,$18,4
	addiu	$5,$19,1
	jal	decode
	move	$6,$16

	.loc 1 67 0
	lw	$4,0($18)
	xor	$12,$17,$2
	subu	$4,$12,$4
	.loc 1 68 0
	srl	$11,$4,11
	sb	$11,0($19)
.LBB10:
.LBB11:
	.loc 1 44 0
	lw	$6,0($16)
	nop
	sra	$10,$6,25
	andi	$5,$10,0x1f
	.loc 1 66 0
	.loc 1 51 0
	bltz	$5,.L26
	move	$7,$2

.L21:
	.loc 1 48 0
	srl	$13,$6,7
	.loc 1 47 0
	sll	$14,$6,1
	.loc 1 51 0
	addiu	$5,$5,-1
	.loc 1 50 0
	.loc 1 51 0
	bgez	$5,.L21
	xor	$6,$14,$13

	sw	$6,0($16)
.L26:
	.loc 1 52 0
	li	$24,1238564864			# 0x49d30000
.LBE11:
.LBE10:
	.loc 1 70 0
	addu	$18,$17,$7
.LBB12:
.LBB13:
	.loc 1 52 0
	ori	$19,$24,0x8788
	xor	$17,$6,$19
.LBE13:
.LBE12:
	.loc 1 70 0
	addu	$16,$18,$4
	subu	$15,$16,$17
	.loc 1 74 0
	lw	$31,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	.loc 1 70 0
	addiu	$2,$15,5
	.loc 1 74 0
	j	$31
	addiu	$sp,$sp,40

.L27:
	lw	$4,0($16)
	.loc 1 52 0
	b	.L32
	li	$9,1238564864			# 0x49d30000

	.set	macro
	.set	reorder
	.end	decode
.LFE1:
	.size	decode, .-decode
	.section	.text.main,"ax",@progbits
	.align	2
	.globl	main
.LFB2:
	.loc 1 76 0
	.set	nomips16
	.ent	main
main:
	.frame	$sp,48,$31		# vars= 8, regs= 5/0, args= 16, gp= 0
	.mask	0x800f0000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	.loc 1 77 0
	li	$2,550043648			# 0x20c90000
	.loc 1 76 0
	addiu	$sp,$sp,-48
.LCFI6:
	.loc 1 77 0
	ori	$2,$2,0x9db1
.LBB14:
	.loc 1 57 0
	lui	$3,%hi(coded)
	lui	$4,%hi(plain)
.LBE14:
	.loc 1 76 0
	sw	$19,36($sp)
.LCFI7:
	sw	$18,32($sp)
.LCFI8:
	sw	$17,28($sp)
.LCFI9:
	sw	$31,40($sp)
.LCFI10:
	sw	$16,24($sp)
.LCFI11:
	.loc 1 77 0
	sw	$2,16($sp)
.LBB15:
	.loc 1 57 0
	addiu	$17,$3,%lo(coded)
	addiu	$18,$4,%lo(plain)
	addiu	$19,$sp,16
.LBB16:
.LBB17:
.LBB18:
	.loc 1 44 0
	li	$5,16			# 0x10
.L36:
	.loc 1 48 0
	srl	$6,$2,7
	.loc 1 47 0
	sll	$7,$2,1
	.loc 1 50 0
	xor	$4,$7,$6
	.loc 1 51 0
	addiu	$5,$5,-1
	.loc 1 50 0
	.loc 1 51 0
	bgez	$5,.L36
	move	$2,$4

	.loc 1 52 0
	li	$10,1238564864			# 0x49d30000
.LBE18:
.LBE17:
	.loc 1 62 0
	lw	$5,0($17)
.LBB19:
.LBB20:
	.loc 1 52 0
	ori	$9,$10,0x8788
	xor	$8,$4,$9
	sw	$4,0($19)
.LBE20:
.LBE19:
	.loc 1 40 0
	.loc 1 62 0
	bne	$5,$0,.L38
	nor	$16,$0,$8

	.loc 1 63 0
	sb	$0,0($18)
.L45:
	b	.L45
	nop

.L38:
	.loc 1 66 0
	addiu	$4,$17,4
	addiu	$5,$18,1
	jal	decode
	move	$6,$19

	.loc 1 67 0
	lw	$15,0($17)
.LBB21:
.LBB22:
	.loc 1 44 0
	lw	$5,0($19)
.LBE22:
.LBE21:
	.loc 1 67 0
	xor	$14,$16,$2
	subu	$13,$14,$15
.LBB23:
.LBB24:
	.loc 1 44 0
	sra	$12,$5,25
.LBE24:
.LBE23:
	.loc 1 68 0
	srl	$11,$13,11
.LBB25:
.LBB26:
	.loc 1 44 0
	andi	$4,$12,0x1f
	.loc 1 68 0
	.loc 1 51 0
	bltz	$4,.L50
	sb	$11,0($18)

.L42:
	.loc 1 48 0
	srl	$16,$5,7
	.loc 1 47 0
	sll	$17,$5,1
	.loc 1 51 0
	addiu	$4,$4,-1
	.loc 1 50 0
	.loc 1 51 0
	bgez	$4,.L42
	xor	$5,$17,$16

	sw	$5,0($19)
.L50:
	b	.L45
	nop

.LBE26:
.LBE25:
.LBE16:
.LBE15:
	.set	macro
	.set	reorder
	.end	main
.LFE2:
	.size	main, .-main
	.globl	plain
	.section	.data
	.align	2
	.type	plain, @object
	.size	plain, 132
plain:
	.space	132
	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 4
	.byte	0x1f
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI5-.LCFI0
	.byte	0x11
	.uleb128 0x11
	.sleb128 -5
	.byte	0x11
	.uleb128 0x1f
	.sleb128 -2
	.byte	0x11
	.uleb128 0x10
	.sleb128 -6
	.byte	0x11
	.uleb128 0x12
	.sleb128 -4
	.byte	0x11
	.uleb128 0x13
	.sleb128 -3
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI6-.LFB2
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI11-.LCFI6
	.byte	0x11
	.uleb128 0x10
	.sleb128 -6
	.byte	0x11
	.uleb128 0x1f
	.sleb128 -2
	.byte	0x11
	.uleb128 0x11
	.sleb128 -5
	.byte	0x11
	.uleb128 0x12
	.sleb128 -4
	.byte	0x11
	.uleb128 0x13
	.sleb128 -3
	.align	2
.LEFDE4:
	.text
.Letext0:
	.section	.debug_info
	.4byte	0x2f4
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	0x0
	.4byte	.LASF12
	.byte	0x1
	.4byte	.LASF13
	.4byte	.LASF14
	.uleb128 0x2
	.4byte	0x5a
	.byte	0x1
	.4byte	.LASF1
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.4byte	0x5a
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x28
	.4byte	0x61
	.uleb128 0x4
	.ascii	"n\000"
	.byte	0x1
	.byte	0x29
	.4byte	0x5a
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x67
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x67
	.byte	0x0
	.uleb128 0x5
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x6
	.byte	0x4
	.4byte	0x5a
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x8
	.4byte	0x9e
	.4byte	0x21
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x6d
	.uleb128 0x9
	.4byte	0x33
	.byte	0x1
	.byte	0x54
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x55
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.uleb128 0x2
	.4byte	0x12a
	.byte	0x1
	.4byte	.LASF2
	.byte	0x1
	.byte	0x39
	.byte	0x1
	.4byte	0x5a
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0x39
	.4byte	0x61
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.byte	0x39
	.4byte	0x12a
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x39
	.4byte	0x61
	.uleb128 0x4
	.ascii	"m\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x67
	.uleb128 0x4
	.ascii	"r\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x67
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x67
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x67
	.uleb128 0xb
	.4byte	0x111
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0xd
	.uleb128 0xe
	.4byte	0x3e
	.uleb128 0xe
	.4byte	0x47
	.uleb128 0xe
	.4byte	0x50
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0xd
	.uleb128 0xe
	.4byte	0x3e
	.uleb128 0xe
	.4byte	0x47
	.uleb128 0xe
	.4byte	0x50
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x130
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x1
	.byte	0x8
	.uleb128 0x8
	.4byte	0x1da
	.4byte	0x9e
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x6d
	.uleb128 0x9
	.4byte	0xb0
	.byte	0x1
	.byte	0x62
	.uleb128 0x9
	.4byte	0xbb
	.byte	0x1
	.byte	0x63
	.uleb128 0x9
	.4byte	0xc6
	.byte	0x1
	.byte	0x60
	.uleb128 0xa
	.4byte	0xd1
	.byte	0x1
	.byte	0x54
	.uleb128 0xe
	.4byte	0xda
	.uleb128 0xa
	.4byte	0xe3
	.byte	0x1
	.byte	0x61
	.uleb128 0xa
	.4byte	0xec
	.byte	0x1
	.byte	0x57
	.uleb128 0xf
	.4byte	0x1ab
	.4byte	0x21
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0x10
	.4byte	.Ldebug_ranges0+0x0
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x56
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.4byte	0x21
	.4byte	.LBB10
	.4byte	.LBE10
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0x10
	.4byte	.Ldebug_ranges0+0x28
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x55
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.4byte	0x2ac
	.byte	0x1
	.4byte	.LASF7
	.byte	0x1
	.byte	0x4c
	.4byte	0x5a
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x6d
	.uleb128 0x13
	.4byte	.LASF8
	.byte	0x1
	.byte	0x4d
	.4byte	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xf
	.4byte	0x229
	.4byte	0x9e
	.4byte	.LBB14
	.4byte	.LBE14
	.uleb128 0x9
	.4byte	0x14a
	.byte	0x1
	.byte	0x61
	.uleb128 0x9
	.4byte	0x151
	.byte	0x1
	.byte	0x62
	.uleb128 0x9
	.4byte	0x158
	.byte	0x1
	.byte	0x63
	.byte	0x0
	.uleb128 0x14
	.4byte	.LBB16
	.4byte	.LBE16
	.uleb128 0xa
	.4byte	0xd1
	.byte	0x1
	.byte	0x52
	.uleb128 0xe
	.4byte	0xda
	.uleb128 0xa
	.4byte	0xe3
	.byte	0x1
	.byte	0x60
	.uleb128 0xe
	.4byte	0xec
	.uleb128 0xf
	.4byte	0x27c
	.4byte	0x21
	.4byte	.LBB17
	.4byte	.LBE17
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0x10
	.4byte	.Ldebug_ranges0+0x40
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x55
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.4byte	0x21
	.4byte	.LBB21
	.4byte	.LBE21
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0x10
	.4byte	.Ldebug_ranges0+0x58
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x54
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.4byte	0x2bc
	.4byte	0x130
	.uleb128 0x16
	.4byte	0x2bc
	.byte	0x83
	.byte	0x0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x4
	.byte	0x7
	.uleb128 0x17
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1
	.4byte	0x2ac
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	plain
	.uleb128 0x15
	.4byte	0x2e5
	.4byte	0x5a
	.uleb128 0x16
	.4byte	0x2bc
	.byte	0x55
	.byte	0x0
	.uleb128 0x17
	.4byte	.LASF11
	.byte	0x1
	.byte	0x3
	.4byte	0x2d5
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	coded
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.4byte	0x41
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2f8
	.4byte	0x6e
	.ascii	"codgen\000"
	.4byte	0x137
	.ascii	"decode\000"
	.4byte	0x1da
	.ascii	"main\000"
	.4byte	0x2c3
	.ascii	"plain\000"
	.4byte	0x2e5
	.ascii	"coded\000"
	.4byte	0x0
	.section	.debug_aranges,"",@progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	0x0
	.4byte	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	.LBB9
	.4byte	.LBE9
	.4byte	.LBB7
	.4byte	.LBE7
	.4byte	.LBB5
	.4byte	.LBE5
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB11
	.4byte	.LBE11
	.4byte	.LBB13
	.4byte	.LBE13
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.ascii	"unsigned int\000"
.LASF14:
	.ascii	"/home/d0013e/code/lab4\000"
.LASF12:
	.ascii	"GNU C 3.4.4 mipssde-6.06.01-20070420\000"
.LASF3:
	.ascii	"seed_addr\000"
.LASF13:
	.ascii	"lab4.c\000"
.LASF5:
	.ascii	"bytarr\000"
.LASF4:
	.ascii	"wordarr\000"
.LASF1:
	.ascii	"codgen\000"
.LASF10:
	.ascii	"plain\000"
.LASF8:
	.ascii	"seed\000"
.LASF2:
	.ascii	"decode\000"
.LASF7:
	.ascii	"main\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF6:
	.ascii	"char\000"
.LASF11:
	.ascii	"coded\000"
	.ident	"GCC: (GNU) 3.4.4 mipssde-6.06.01-20070420"
