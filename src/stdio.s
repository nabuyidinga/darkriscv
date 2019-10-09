	.file	"stdio.c"
	.option nopic
	.text
	.align	2
	.globl	getchar
	.type	getchar, @function
getchar:
	lui	a5,%hi(io)
	addi	a5,a5,%lo(io)
.L2:
	lbu	a4,4(a5)
	andi	a4,a4,2
	beqz	a4,.L2
	lbu	a0,5(a5)
	ret
	.size	getchar, .-getchar
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
	lui	a5,%hi(io)
	li	a4,10
	addi	a5,a5,%lo(io)
	bne	a0,a4,.L8
.L7:
	lbu	a4,4(a5)
	andi	a4,a4,1
	bnez	a4,.L7
	li	a4,13
	sb	a4,5(a5)
.L8:
	lbu	a4,4(a5)
	andi	a4,a4,1
	bnez	a4,.L8
	andi	a4,a0,0xff
	sb	a4,5(a5)
	mv	a0,a4
	ret
	.size	putchar, .-putchar
	.align	2
	.globl	gets
	.type	gets, @function
gets:
	addi	sp,sp,-48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	ra,44(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	mv	s1,a0
	mv	s4,a1
	mv	s0,a0
	li	s5,10
	li	s6,13
	li	s7,8
.L12:
	addi	s3,s4,-1
	beqz	s3,.L16
	call	getchar
	mv	s2,a0
	bne	a0,s5,.L13
.L16:
	li	a0,10
	call	putchar
	sb	zero,0(s0)
	bne	s0,s1,.L14
	li	s1,0
.L14:
	lw	ra,44(sp)
	lw	s0,40(sp)
	mv	a0,s1
	lw	s2,32(sp)
	lw	s1,36(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	addi	sp,sp,48
	jr	ra
.L13:
	beq	a0,s6,.L16
	call	putchar
	bne	s2,s7,.L17
	beq	s0,s1,.L18
	sb	zero,-1(s0)
	mv	s3,s4
	addi	s0,s0,-1
.L18:
	mv	s4,s3
	j	.L12
.L17:
	sb	s2,0(s0)
	addi	s0,s0,1
	j	.L18
	.size	gets, .-gets
	.align	2
	.globl	putstr
	.type	putstr, @function
putstr:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	mv	s0,a0
	bnez	a0,.L24
	lui	s0,%hi(.LC2)
	addi	s0,s0,%lo(.LC2)
.L24:
	lbu	a0,0(s0)
	bnez	a0,.L26
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L26:
	addi	s0,s0,1
	call	putchar
	j	.L24
	.size	putstr, .-putstr
	.align	2
	.globl	puts
	.type	puts, @function
puts:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	putstr
	lw	ra,12(sp)
	li	a0,10
	addi	sp,sp,16
	tail	putchar
	.size	puts, .-puts
	.align	2
	.globl	putdx
	.type	putdx, @function
putdx:
	addi	sp,sp,-96
	sw	s4,72(sp)
	mv	s4,a1
	lui	a1,%hi(.LANCHOR0)
	sw	s0,88(sp)
	sw	s3,76(sp)
	addi	s0,a1,%lo(.LANCHOR0)
	li	a2,44
	addi	a1,a1,%lo(.LANCHOR0)
	mv	s3,a0
	addi	a0,sp,20
	sw	ra,92(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	call	memcpy
	addi	a1,s0,44
	li	a2,20
	mv	a0,sp
	call	memcpy
	mv	s0,sp
	beqz	s4,.L32
	addi	s0,sp,20
.L32:
	lui	s1,%hi(.LC3)
	li	s2,24
	li	s5,1
	addi	s1,s1,%lo(.LC3)
	li	s6,10
.L33:
	lw	a5,0(s0)
	bnez	a5,.L37
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	addi	sp,sp,96
	jr	ra
.L37:
	beq	a5,s5,.L34
	bgtu	a5,s3,.L35
.L34:
	beqz	s4,.L36
	divu	a5,s3,a5
	remu	a5,a5,s6
.L41:
	add	a5,s1,a5
	lbu	a0,0(a5)
	call	putchar
.L35:
	addi	s2,s2,-8
	addi	s0,s0,4
	j	.L33
.L36:
	addi	a5,s2,4
	srl	a5,s3,a5
	andi	a5,a5,15
	add	a5,s1,a5
	lbu	a0,0(a5)
	call	putchar
	srl	a5,s3,s2
	andi	a5,a5,15
	j	.L41
	.size	putdx, .-putdx
	.align	2
	.globl	putx
	.type	putx, @function
putx:
	li	a1,0
	tail	putdx
	.size	putx, .-putx
	.align	2
	.globl	putd
	.type	putd, @function
putd:
	li	a1,1
	tail	putdx
	.size	putd, .-putd
	.align	2
	.globl	printf
	.type	printf, @function
printf:
	addi	sp,sp,-80
	sw	a5,68(sp)
	addi	a5,sp,52
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	ra,44(sp)
	sw	s1,36(sp)
	mv	s0,a0
	sw	a1,52(sp)
	sw	a2,56(sp)
	sw	a3,60(sp)
	sw	a4,64(sp)
	sw	a6,72(sp)
	sw	a7,76(sp)
	sw	a5,12(sp)
	li	s2,37
	li	s3,115
	li	s4,120
	li	s5,100
.L45:
	lbu	a0,0(s0)
	bnez	a0,.L51
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	addi	sp,sp,80
	jr	ra
.L51:
	addi	s1,s0,1
	bne	a0,s2,.L46
	lbu	a0,1(s0)
	bne	a0,s3,.L47
	lw	a5,12(sp)
	lw	a0,0(a5)
	addi	a4,a5,4
	sw	a4,12(sp)
	call	putstr
.L48:
	addi	s0,s1,1
	j	.L45
.L47:
	bne	a0,s4,.L49
	lw	a5,12(sp)
	lw	a0,0(a5)
	addi	a4,a5,4
	sw	a4,12(sp)
	call	putx
	j	.L48
.L49:
	bne	a0,s5,.L50
	lw	a5,12(sp)
	lw	a0,0(a5)
	addi	a4,a5,4
	sw	a4,12(sp)
	call	putd
	j	.L48
.L50:
	call	putchar
	j	.L48
.L46:
	call	putchar
	mv	s1,s0
	j	.L48
	.size	printf, .-printf
	.align	2
	.globl	strncmp
	.type	strncmp, @function
strncmp:
	addi	a5,a0,1
	add	a2,a0,a2
.L54:
	lbu	a0,-1(a5)
	lbu	a4,0(a1)
	beq	a5,a2,.L55
	beqz	a0,.L55
	beqz	a4,.L55
	addi	a5,a5,1
	beq	a0,a4,.L56
.L55:
	sub	a0,a0,a4
	ret
.L56:
	addi	a1,a1,1
	j	.L54
	.size	strncmp, .-strncmp
	.align	2
	.globl	strcmp
	.type	strcmp, @function
strcmp:
	li	a2,-1
	tail	strncmp
	.size	strcmp, .-strcmp
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	mv	a4,a0
	mv	a5,a0
.L65:
	sub	a0,a5,a4
	addi	a5,a5,1
	lbu	a3,-1(a5)
	bnez	a3,.L65
	ret
	.size	strlen, .-strlen
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	add	a2,a0,a2
	mv	a5,a0
.L68:
	bne	a5,a2,.L69
	ret
.L69:
	addi	a1,a1,1
	lbu	a4,-1(a1)
	addi	a5,a5,1
	sb	a4,-1(a5)
	j	.L68
	.size	memcpy, .-memcpy
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	add	a2,a0,a2
	mv	a5,a0
.L71:
	bne	a5,a2,.L72
	ret
.L72:
	addi	a5,a5,1
	sb	a1,-1(a5)
	j	.L71
	.size	memset, .-memset
	.align	2
	.globl	strtok
	.type	strtok, @function
strtok:
	addi	sp,sp,-32
	sw	s0,24(sp)
	mv	s0,a0
	mv	a0,a1
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	sw	s1,20(sp)
	mv	s2,a1
	call	strlen
	mv	s3,a0
	bnez	s0,.L74
	lui	a5,%hi(nxt.1540)
	lw	s0,%lo(nxt.1540)(a5)
	beqz	s0,.L75
.L74:
	mv	s1,s0
.L76:
	lbu	a5,0(s1)
	bnez	a5,.L77
	lui	a5,%hi(nxt.1540)
	sw	zero,%lo(nxt.1540)(a5)
	j	.L75
.L77:
	mv	a2,s3
	mv	a1,s2
	mv	a0,s1
	call	strncmp
	addi	a5,s1,1
	bnez	a0,.L78
	lui	a4,%hi(nxt.1540)
	sb	zero,0(s1)
	sw	a5,%lo(nxt.1540)(a4)
.L75:
	mv	a0,s0
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L78:
	mv	s1,a5
	j	.L76
	.size	strtok, .-strtok
	.align	2
	.globl	atoi
	.type	atoi, @function
atoi:
	li	a3,0
	li	a5,0
	li	a2,45
.L84:
	bnez	a0,.L86
.L90:
	bnez	a3,.L87
.L83:
	mv	a0,a5
	ret
.L91:
	li	a3,1
	j	.L85
.L86:
	lbu	a4,0(a0)
	beqz	a4,.L90
	beq	a4,a2,.L91
	slli	a1,a5,3
	addi	a4,a4,-48
	add	a4,a4,a1
	slli	a5,a5,1
	add	a5,a4,a5
.L85:
	addi	a0,a0,1
	j	.L84
.L87:
	sub	a5,zero,a5
	j	.L83
	.size	atoi, .-atoi
	.align	2
	.globl	xtoi
	.type	xtoi, @function
xtoi:
	mv	a3,a0
	li	a2,57
	li	a0,0
.L93:
	beqz	a3,.L92
	lbu	a5,0(a3)
	bnez	a5,.L97
.L92:
	ret
.L97:
	slli	a4,a0,4
	bgtu	a5,a2,.L94
	addi	a5,a5,-48
.L101:
	add	a0,a5,a4
	addi	a3,a3,1
	j	.L93
.L94:
	andi	a5,a5,95
	addi	a5,a5,-55
	j	.L101
	.size	xtoi, .-xtoi
	.align	2
	.globl	mac
	.type	mac, @function
mac:
#APP
# 271 "stdio.c" 1
	.word 0x00c5857F
# 0 "" 2
#NO_APP
	ret
	.size	mac, .-mac
	.align	2
	.globl	__umulsi3
	.type	__umulsi3, @function
__umulsi3:
	mv	a5,a0
	li	a0,0
	bltu	a5,a1,.L104
.L105:
	bnez	a1,.L110
	ret
.L107:
	andi	a4,a5,1
	beqz	a4,.L106
	add	a0,a0,a1
.L106:
	srli	a5,a5,1
	slli	a1,a1,1
.L104:
	bnez	a5,.L107
	ret
.L110:
	andi	a4,a1,1
	beqz	a4,.L109
	add	a0,a0,a5
.L109:
	slli	a5,a5,1
	srli	a1,a1,1
	j	.L105
	.size	__umulsi3, .-__umulsi3
	.align	2
	.globl	__mulsi3
	.type	__mulsi3, @function
__mulsi3:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	mv	a5,a0
	mv	a4,a1
	bgez	a0,.L119
	sub	a5,zero,a0
	li	s0,1
	bltz	a1,.L124
	mv	a0,a5
	call	__umulsi3
	j	.L123
.L127:
	lw	s0,8(sp)
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	__umulsi3
.L119:
	bgez	a1,.L127
	li	s0,0
.L124:
	mv	a0,a5
	sub	a1,zero,a4
	call	__umulsi3
	mv	a5,a0
	bnez	s0,.L118
.L123:
	sub	a5,zero,a0
.L118:
	lw	ra,12(sp)
	lw	s0,8(sp)
	mv	a0,a5
	addi	sp,sp,16
	jr	ra
	.size	__mulsi3, .-__mulsi3
	.align	2
	.globl	__udiv_umod_si3
	.type	__udiv_umod_si3, @function
__udiv_umod_si3:
	li	a5,1
	bnez	a1,.L131
.L130:
	mv	a0,a1
	ret
.L132:
	slli	a5,a5,1
	slli	a1,a1,1
.L131:
	bgtu	a0,a1,.L132
	mv	a4,a1
	li	a1,0
.L133:
	beqz	a0,.L135
	bnez	a5,.L136
.L135:
	bnez	a2,.L130
	mv	a1,a0
	j	.L130
.L136:
	bltu	a0,a4,.L134
	sub	a0,a0,a4
	add	a1,a1,a5
.L134:
	srli	a5,a5,1
	srli	a4,a4,1
	j	.L133
	.size	__udiv_umod_si3, .-__udiv_umod_si3
	.align	2
	.globl	__udivsi3
	.type	__udivsi3, @function
__udivsi3:
	li	a2,1
	tail	__udiv_umod_si3
	.size	__udivsi3, .-__udivsi3
	.align	2
	.globl	__umodsi3
	.type	__umodsi3, @function
__umodsi3:
	li	a2,0
	tail	__udiv_umod_si3
	.size	__umodsi3, .-__umodsi3
	.align	2
	.globl	__div_mod_si3
	.type	__div_mod_si3, @function
__div_mod_si3:
	beqz	a1,.L159
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	mv	s2,a2
	li	s0,0
	bgez	a0,.L147
	sub	a0,zero,a0
	li	s0,1
.L147:
	li	s1,0
	bgez	a1,.L148
	sub	a1,zero,a1
	li	s1,1
.L148:
	mv	a2,s2
	call	__udiv_umod_si3
	mv	a1,a0
	beqz	s2,.L149
	beq	s0,s1,.L146
	sub	a1,zero,a0
.L146:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	mv	a0,a1
	addi	sp,sp,16
	jr	ra
.L149:
	beqz	s0,.L146
	sub	a1,zero,a0
	j	.L146
.L159:
	mv	a0,a1
	ret
	.size	__div_mod_si3, .-__div_mod_si3
	.align	2
	.globl	__divsi3
	.type	__divsi3, @function
__divsi3:
	li	a2,1
	tail	__div_mod_si3
	.size	__divsi3, .-__divsi3
	.align	2
	.globl	__modsi3
	.type	__modsi3, @function
__modsi3:
	li	a2,0
	tail	__div_mod_si3
	.size	__modsi3, .-__modsi3
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	1000000000
	.word	100000000
	.word	10000000
	.word	1000000
	.word	100000
	.word	10000
	.word	1000
	.word	100
	.word	10
	.word	1
	.word	0
.LC1:
	.word	16777216
	.word	65536
	.word	256
	.word	1
	.word	0
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"(NULL)"
	.zero	1
.LC3:
	.string	"0123456789abcdef"
	.section	.sbss,"aw",@nobits
	.align	2
	.type	nxt.1540, @object
	.size	nxt.1540, 4
nxt.1540:
	.zero	4
	.ident	"GCC: (GNU) 7.2.0"
