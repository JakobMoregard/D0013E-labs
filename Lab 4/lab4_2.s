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
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
.LCFI0:
	sw	$17,20($sp)
.LCFI1:
	move	$17,$4
	.loc 1 60 0
	move	$4,$6
	.loc 1 57 0
	sw	$20,32($sp)
.LCFI2:
	sw	$19,28($sp)
.LCFI3:
	sw	$18,24($sp)
.LCFI4:
	move	$20,$6
	move	$19,$5
	sw	$31,36($sp)
.LCFI5:
	.loc 1 57 0
.LCFI6:
	.loc 1 60 0
	jal	codgen
	sw	$16,16($sp)

	.loc 1 62 0
	lw	$3,0($17)
	.loc 1 60 0
	nor	$18,$0,$2
	.loc 1 66 0
	addiu	$4,$17,4
	addiu	$5,$19,1
	move	$6,$20
	.loc 1 64 0
	.loc 1 62 0
	bne	$3,$0,.L10
	move	$2,$18

	.loc 1 63 0
	sb	$0,0($19)
	.loc 1 74 0
	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	j	$31
	addiu	$sp,$sp,40

.L10:
	.loc 1 66 0
	jal	decode
	nop

	.loc 1 67 0
	lw	$7,0($17)
	xor	$6,$18,$2
	subu	$17,$6,$7
	.loc 1 66 0
	move	$16,$2
	.loc 1 68 0
	srl	$2,$17,11
	.loc 1 69 0
	move	$4,$20
	.loc 1 68 0
	.loc 1 69 0
	jal	codgen
	sb	$2,0($19)

	.loc 1 70 0
	addu	$5,$18,$16
	addu	$4,$5,$17
	subu	$16,$4,$2
	addiu	$2,$16,5
	.loc 1 74 0
	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	j	$31
	addiu	$sp,$sp,40

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
	.frame	$sp,32,$31		# vars= 8, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
.LCFI7:
	.loc 1 79 0
	lui	$4,%hi(coded)
	lui	$5,%hi(plain)
	.loc 1 77 0
	li	$3,550043648			# 0x20c90000
	ori	$2,$3,0x9db1
	.loc 1 79 0
	addiu	$4,$4,%lo(coded)
	addiu	$5,$5,%lo(plain)
	addiu	$6,$sp,16
	.loc 1 76 0
	sw	$31,24($sp)
.LCFI8:
	.loc 1 77 0
	.loc 1 79 0
	jal	decode
	sw	$2,16($sp)

.L14:
	b	.L14
	nop

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
	.4byte	.LCFI1-.LCFI0
	.byte	0x11
	.uleb128 0x11
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI4-.LCFI1
	.byte	0x11
	.uleb128 0x12
	.sleb128 -4
	.byte	0x11
	.uleb128 0x13
	.sleb128 -3
	.byte	0x11
	.uleb128 0x14
	.sleb128 -2
	.byte	0x4
	.4byte	.LCFI6-.LCFI4
	.byte	0x11
	.uleb128 0x10
	.sleb128 -6
	.byte	0x11
	.uleb128 0x1f
	.sleb128 -1
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI7-.LFB2
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0x11
	.uleb128 0x1f
	.sleb128 -2
	.align	2
.LEFDE4:
	.text
.Letext0:
	.section	.debug_info
	.4byte	0x166
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.LASF12
	.byte	0x1
	.4byte	.LASF13
	.4byte	.LASF14
	.uleb128 0x2
	.4byte	0x67
	.byte	0x1
	.4byte	.LASF1
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.4byte	0x67
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x6d
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x28
	.4byte	0x6e
	.byte	0x1
	.byte	0x54
	.uleb128 0x4
	.ascii	"n\000"
	.byte	0x1
	.byte	0x29
	.4byte	0x67
	.byte	0x1
	.byte	0x55
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x74
	.byte	0x1
	.byte	0x52
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x74
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.uleb128 0x5
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x6
	.byte	0x4
	.4byte	0x67
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	0xe8
	.byte	0x1
	.4byte	.LASF2
	.byte	0x1
	.byte	0x39
	.byte	0x1
	.4byte	0x67
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x6d
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0x39
	.4byte	0x6e
	.byte	0x1
	.byte	0x61
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.byte	0x39
	.4byte	0xe8
	.byte	0x1
	.byte	0x63
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x39
	.4byte	0x6e
	.byte	0x1
	.byte	0x64
	.uleb128 0x4
	.ascii	"m\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x74
	.byte	0x1
	.byte	0x61
	.uleb128 0x8
	.ascii	"r\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x74
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x74
	.byte	0x1
	.byte	0x62
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x74
	.byte	0x1
	.byte	0x60
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xee
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x1
	.byte	0x8
	.uleb128 0x9
	.4byte	0x11e
	.byte	0x1
	.4byte	.LASF7
	.byte	0x1
	.byte	0x4c
	.4byte	0x67
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x6d
	.uleb128 0xa
	.4byte	.LASF8
	.byte	0x1
	.byte	0x4d
	.4byte	0x67
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.byte	0x0
	.uleb128 0xb
	.4byte	0x12e
	.4byte	0xee
	.uleb128 0xc
	.4byte	0x12e
	.byte	0x83
	.byte	0x0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x4
	.byte	0x7
	.uleb128 0xd
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1
	.4byte	0x11e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	plain
	.uleb128 0xb
	.4byte	0x157
	.4byte	0x67
	.uleb128 0xc
	.4byte	0x12e
	.byte	0x55
	.byte	0x0
	.uleb128 0xd
	.4byte	.LASF11
	.byte	0x1
	.byte	0x3
	.4byte	0x147
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
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
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
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
	.4byte	0x16a
	.4byte	0x1d
	.ascii	"codgen\000"
	.4byte	0x7b
	.ascii	"decode\000"
	.4byte	0xf5
	.ascii	"main\000"
	.4byte	0x135
	.ascii	"plain\000"
	.4byte	0x157
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
