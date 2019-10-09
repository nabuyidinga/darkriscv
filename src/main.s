	.file	"main.c"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-176
	sw	ra,172(sp)
	sw	s0,168(sp)
	sw	s1,164(sp)
	lui	s0,%hi(io)
	sw	s2,160(sp)
	sw	s3,156(sp)
	sw	s4,152(sp)
	sw	s5,148(sp)
	sw	s6,144(sp)
	sw	s7,140(sp)
	sw	s8,136(sp)
	sw	s9,132(sp)
	sw	s10,128(sp)
	sw	s11,124(sp)
	call	banner
	lbu	a5,%lo(io)(s0)
	lui	a4,%hi(board_name)
	addi	a4,a4,%lo(board_name)
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a1,0(a5)
	lbu	a2,%lo(io)(s0)
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	printf
	lui	a1,%hi(.LC4)
	lui	a0,%hi(.LC5)
	addi	a1,a1,%lo(.LC4)
	addi	a0,a0,%lo(.LC5)
	call	printf
	addi	a5,s0,%lo(io)
	lbu	s1,1(a5)
	lbu	s2,2(a5)
	lui	a5,%hi(threads)
	lw	a3,%lo(threads)(a5)
	li	a4,1
	andi	s1,s1,0xff
	andi	s2,s2,0xff
	addi	s0,s0,%lo(io)
	mv	s3,a5
	ble	a3,a4,.L40
	lui	a4,%hi(.LC0)
	addi	a4,a4,%lo(.LC0)
.L2:
	li	a2,16
	li	a1,16
	li	a0,1000
	sw	a4,12(sp)
	call	mac
	li	a5,1256
	lw	a4,12(sp)
	bne	a0,a5,.L41
	lui	a5,%hi(.LC2)
	addi	a5,a5,%lo(.LC2)
.L3:
	lui	a3,%hi(.LC6)
	lui	a0,%hi(.LC7)
	mv	a2,s2
	addi	a3,a3,%lo(.LC6)
	mv	a1,s1
	addi	a0,a0,%lo(.LC7)
	call	printf
	lhu	a1,6(s0)
	lui	a0,%hi(.LC8)
	addi	a0,a0,%lo(.LC8)
	sw	zero,%lo(threads)(s3)
	call	printf
	lbu	a4,1(s0)
	li	a5,999424
	lbu	a3,2(s0)
	addi	a5,a5,576
	mul	a5,a5,a4
	li	a4,1000
	lw	a1,12(s0)
	lw	a2,12(s0)
	lui	a0,%hi(.LC9)
	addi	a1,a1,1
	addi	a0,a0,%lo(.LC9)
	mul	a4,a4,a3
	add	a5,a5,a4
	divu	a1,a5,a1
	call	printf
	li	a0,10
	call	putchar
	lui	a0,%hi(.LC10)
	addi	a0,a0,%lo(.LC10)
	call	puts
	lui	a5,%hi(ip)
	lw	s1,%lo(ip)(a5)
	lui	a5,%hi(port)
	lhu	s4,%lo(port)(a5)
	srli	s2,s1,8
	srli	s3,s1,16
	andi	s2,s2,0xff
	andi	s5,s1,255
	andi	s3,s3,0xff
	srli	s6,s1,24
	lui	a0,%hi(.LC11)
	mv	a2,s2
	mv	a5,s4
	mv	a4,s6
	mv	a3,s3
	mv	a1,s5
	addi	a0,a0,%lo(.LC11)
	call	printf
	li	a5,305418240
	lui	a0,%hi(.LC12)
	addi	a5,a5,1656
	li	a4,18
	li	a3,52
	li	a2,86
	li	a1,120
	addi	a0,a0,%lo(.LC12)
	call	printf
	lui	a0,%hi(.LC13)
	mv	a5,s1
	mv	a2,s2
	mv	a4,s6
	mv	a3,s3
	mv	a1,s5
	addi	a0,a0,%lo(.LC13)
	call	printf
	lui	a0,%hi(.LC14)
	mv	a4,s4
	mv	a3,s4
	srli	a2,s4,8
	andi	a1,s4,0xff
	addi	a0,a0,%lo(.LC14)
	call	printf
	lui	a0,%hi(.LC15)
	li	a4,11
	li	a3,10
	li	a2,11
	li	a1,10
	addi	a0,a0,%lo(.LC15)
	call	printf
	li	a0,10
	call	putchar
	lui	a0,%hi(.LC16)
	addi	a0,a0,%lo(.LC16)
	call	puts
	lui	s2,%hi(.LC25)
.L39:
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	printf
	li	a2,64
	li	a1,0
	addi	a0,sp,48
	call	memset
	li	a1,64
	addi	a0,sp,48
	call	gets
	addi	s3,sp,16
	li	s1,0
	li	s4,8
.L4:
	li	a0,0
	bnez	s1,.L6
	addi	a0,sp,48
.L6:
	lui	a5,%hi(.LC18)
	addi	a1,a5,%lo(.LC18)
	call	strtok
	sw	a0,0(s3)
	beqz	a0,.L5
	addi	s1,s1,1
	addi	s3,s3,4
	bne	s1,s4,.L4
.L5:
	lw	s1,16(sp)
	beqz	s1,.L39
	lui	a5,%hi(.LC19)
	addi	a1,a5,%lo(.LC19)
	mv	a0,s1
	call	strcmp
	bnez	a0,.L10
	lui	a0,%hi(.LC20)
	addi	a0,a0,%lo(.LC20)
	call	printf
	j	.L39
.L40:
	lui	a4,%hi(.LC1)
	addi	a4,a4,%lo(.LC1)
	j	.L2
.L41:
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
	j	.L3
.L10:
	lui	a5,%hi(.LC21)
	addi	a1,a5,%lo(.LC21)
	mv	a0,s1
	call	strcmp
	bnez	a0,.L11
	call	banner
	lui	a0,%hi(.LC22)
	addi	a0,a0,%lo(.LC22)
	call	puts
	j	.L39
.L11:
	lui	a1,%hi(.LC23)
	addi	a1,a1,%lo(.LC23)
	mv	a0,s1
	call	strcmp
	bnez	a0,.L12
	lw	a0,20(sp)
	beqz	a0,.L13
	call	xtoi
.L13:
	addi	s4,a0,256
	lui	s5,%hi(.LC24)
	li	s6,94
.L17:
	mv	s3,a0
	mv	a1,a0
	addi	a0,s5,%lo(.LC24)
	call	printf
	addi	s1,s3,16
	mv	s7,s3
.L14:
	lbu	a1,0(s7)
	addi	a0,s2,%lo(.LC25)
	addi	s7,s7,1
	call	printf
	bne	s7,s1,.L14
.L16:
	lbu	a0,0(s3)
	addi	a5,a0,-32
	andi	a5,a5,0xff
	bleu	a5,s6,.L15
	li	a0,46
.L15:
	addi	s3,s3,1
	call	putchar
	bne	s3,s7,.L16
	li	a0,10
	call	putchar
	mv	a0,s1
	bne	s4,s1,.L17
	j	.L39
.L12:
	lui	a1,%hi(.LC26)
	li	a2,2
	addi	a1,a1,%lo(.LC26)
	mv	a0,s1
	call	strncmp
	beqz	a0,.L19
	lui	a1,%hi(.LC27)
	li	a2,2
	addi	a1,a1,%lo(.LC27)
	mv	a0,s1
	call	strncmp
	bnez	a0,.L20
.L19:
	lbu	a4,2(s1)
	li	a5,109
	bne	a4,a5,.L44
	lw	a0,20(sp)
	li	s7,3
	call	xtoi
	mv	s6,a0
	li	a5,2
.L21:
	addi	a4,sp,112
	addi	s3,a5,1
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,-96(a5)
	li	s1,0
	li	s8,98
	call	xtoi
	mv	a1,a0
	mv	s4,a0
	lui	a0,%hi(.LC24)
	addi	a0,a0,%lo(.LC24)
	call	printf
	li	s9,119
	li	s10,108
.L22:
	bne	s6,s1,.L29
	li	a0,10
	call	putchar
	j	.L39
.L44:
	li	a5,1
	li	s6,1
	li	s7,2
	j	.L21
.L29:
	lw	a5,16(sp)
	li	a4,114
	add	s5,a5,s7
	lbu	a5,0(a5)
	bne	a5,a4,.L23
	lbu	a5,0(s5)
	bne	a5,s8,.L24
	add	a5,s4,s1
	lbu	a1,0(a5)
	addi	a0,s2,%lo(.LC25)
	call	printf
.L24:
	lbu	a5,0(s5)
	bne	a5,s9,.L25
	slli	a5,s1,1
	add	a5,a5,s4
	lh	a1,0(a5)
	addi	a0,s2,%lo(.LC25)
	call	printf
.L25:
	lbu	a5,0(s5)
	bne	a5,s10,.L26
	slli	a5,s1,2
	add	a5,a5,s4
	lw	a1,0(a5)
.L69:
	addi	a0,s2,%lo(.LC25)
	call	printf
.L26:
	addi	s1,s1,1
	j	.L22
.L23:
	addi	a5,s3,1
	sw	a5,12(sp)
	slli	s3,s3,2
	addi	a5,sp,112
	add	s3,a5,s3
	lw	a0,-96(s3)
	call	xtoi
	lbu	a4,0(s5)
	mv	s11,a0
	bne	a4,s8,.L27
	add	a4,s4,s1
	sb	a0,0(a4)
	andi	a1,a0,0xff
	addi	a0,s2,%lo(.LC25)
	call	printf
.L27:
	lbu	a4,0(s5)
	bne	a4,s9,.L28
	slli	a1,s11,16
	slli	a4,s1,1
	srai	a1,a1,16
	add	a4,a4,s4
	sh	a1,0(a4)
	addi	a0,s2,%lo(.LC25)
	call	printf
.L28:
	lbu	a4,0(s5)
	lw	s3,12(sp)
	bne	a4,s10,.L26
	slli	a4,s1,2
	add	a4,a4,s4
	sw	s11,0(a4)
	mv	a1,s11
	j	.L69
.L20:
	lui	a1,%hi(.LC28)
	addi	a1,a1,%lo(.LC28)
	mv	a0,s1
	call	strcmp
	bnez	a0,.L30
	lw	a0,20(sp)
	beqz	a0,.L31
	call	xtoi
	slli	a0,a0,16
	srli	a0,a0,16
	sh	a0,8(s0)
.L31:
	lhu	a1,8(s0)
	lui	a0,%hi(.LC29)
	addi	a0,a0,%lo(.LC29)
.L68:
	call	printf
	j	.L39
.L30:
	lui	a1,%hi(.LC30)
	addi	a1,a1,%lo(.LC30)
	mv	a0,s1
	call	strcmp
	bnez	a0,.L32
	lw	a0,20(sp)
	beqz	a0,.L33
	call	atoi
	sw	a0,12(s0)
.L33:
	lui	a0,%hi(.LC31)
	lw	a1,12(s0)
	addi	a0,a0,%lo(.LC31)
	j	.L68
.L32:
	lui	a1,%hi(.LC32)
	addi	a1,a1,%lo(.LC32)
	mv	a0,s1
	call	strcmp
	bnez	a0,.L34
	lw	a0,20(sp)
	beqz	a0,.L35
	call	xtoi
	slli	a0,a0,16
	srli	a0,a0,16
	sh	a0,10(s0)
.L35:
	lui	a0,%hi(.LC33)
	lhu	a1,10(s0)
	addi	a0,a0,%lo(.LC33)
	j	.L68
.L34:
	lui	a1,%hi(.LC34)
	addi	a1,a1,%lo(.LC34)
	mv	a0,s1
	call	strcmp
	bnez	a0,.L36
	lw	a0,20(sp)
	call	atoi
	mv	s1,a0
	lw	a0,24(sp)
	call	atoi
	mul	a1,s1,a0
	lui	a0,%hi(.LC35)
	addi	a0,a0,%lo(.LC35)
	j	.L68
.L36:
	lui	a1,%hi(.LC36)
	addi	a1,a1,%lo(.LC36)
	mv	a0,s1
	call	strcmp
	bnez	a0,.L37
	lw	a0,20(sp)
	call	atoi
	mv	s1,a0
	lw	a0,24(sp)
	call	atoi
	rem	a2,s1,a0
	div	a1,s1,a0
	lui	a0,%hi(.LC37)
	addi	a0,a0,%lo(.LC37)
	call	printf
	j	.L39
.L37:
	lui	a1,%hi(.LC38)
	addi	a1,a1,%lo(.LC38)
	mv	a0,s1
	call	strcmp
	bnez	a0,.L38
	lw	a0,20(sp)
	call	atoi
	mv	s1,a0
	lw	a0,24(sp)
	call	atoi
	mv	s3,a0
	lw	a0,28(sp)
	call	atoi
	slli	a2,a0,16
	slli	a1,s3,16
	srai	a1,a1,16
	srai	a2,a2,16
	mv	a0,s1
	call	mac
	mv	a1,a0
	lui	a0,%hi(.LC39)
	addi	a0,a0,%lo(.LC39)
	j	.L68
.L38:
	lbu	a5,0(s1)
	beqz	a5,.L39
	lui	a0,%hi(.LC40)
	mv	a1,s1
	addi	a0,a0,%lo(.LC40)
	j	.L68
	.size	main, .-main
	.globl	opts
	.globl	port
	.globl	ip
	.globl	test
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"+MT"
.LC1:
	.string	""
	.zero	3
.LC2:
	.string	"+MAC"
	.zero	3
.LC3:
	.string	"board: %s (id=%d)\n"
	.zero	1
.LC4:
	.string	"Wed, 09 Oct 2019 10:56:43 +0800"
.LC5:
	.string	"build: darkriscv fw build %s\n"
	.zero	2
.LC6:
	.string	"rv32g"
	.zero	2
.LC7:
	.string	"core0: darkriscv@%d.%dMHz with %s%s%s\n"
	.zero	1
.LC8:
	.string	"uart0: 115200 bps (div=%d)\n"
.LC9:
	.string	"timr0: periodic timer=%dHz (io.timer=%d)\n"
	.zero	2
.LC10:
	.string	"endian-test (little-endian):"
	.zero	3
.LC11:
	.string	"ip:port=%d.%d.%d.%d:%d\n"
.LC12:
	.string	"data.ref  = %x %x %x %x = %x\n"
	.zero	2
.LC13:
	.string	"data.ip   = %x %x %x %x = %x\n"
	.zero	2
.LC14:
	.string	"data.port = %x %x = %x/%d\n"
	.zero	1
.LC15:
	.string	"data.opts = %x %x = %x %x\n"
	.zero	1
.LC16:
	.string	"Welcome to DarkRISCV!"
	.zero	2
.LC17:
	.string	"> "
	.zero	1
.LC18:
	.string	" "
	.zero	2
.LC19:
	.string	"clear"
	.zero	2
.LC20:
	.string	"\033[H\033[2J"
.LC21:
	.string	"atros"
	.zero	2
.LC22:
	.string	"wow! hello atros! o/"
	.zero	3
.LC23:
	.string	"dump"
	.zero	3
.LC24:
	.string	"%x: "
	.zero	3
.LC25:
	.string	"%x "
.LC26:
	.string	"rd"
	.zero	1
.LC27:
	.string	"wr"
	.zero	1
.LC28:
	.string	"led"
.LC29:
	.string	"led = %x\n"
	.zero	2
.LC30:
	.string	"timer"
	.zero	2
.LC31:
	.string	"timer = %d\n"
.LC32:
	.string	"gpio"
	.zero	3
.LC33:
	.string	"gpio = %x\n"
	.zero	1
.LC34:
	.string	"mul"
.LC35:
	.string	"mul = %d\n"
	.zero	2
.LC36:
	.string	"div"
.LC37:
	.string	"div = %d, mod = %d\n"
.LC38:
	.string	"mac"
.LC39:
	.string	"mac = %d\n"
	.zero	2
.LC40:
	.string	"command: [%s] not found.\nvalid commands: clear, dump <hex>, led <hex>, timer <dec>, gpio <hex>\n                mul <dec> <dec>, div <dec> <dec>, mac <dec> <dec> <dec>\n                rd[m][bwl] <hex> [<hex> when m], wr[m][bwl] <hex> <hex> [<hex> when m]\n"
	.section	.sdata,"aw",@progbits
	.align	2
	.type	opts, @object
	.size	opts, 2
opts:
	.half	-21555
	.type	port, @object
	.size	port, 2
port:
	.half	3128
	.type	ip, @object
	.size	ip, 4
ip:
	.word	-1408237567
	.type	test, @object
	.size	test, 4
test:
	.word	305419896
	.ident	"GCC: (GNU) 7.2.0"
