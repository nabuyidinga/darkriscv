	.file	"io.c"
	.option nopic
	.globl	board_name
	.globl	threads
	.comm	io,16,4
	.data
	.align	2
	.type	board_name, @object
	.size	board_name, 24
board_name:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	0
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"simulation only"
.LC1:
	.string	"avnet microboard spartan-6 lx9"
	.zero	1
.LC2:
	.string	"xilinx ac701 artix-7 a200"
	.zero	2
.LC3:
	.string	"qmtech sdram lx16"
	.zero	2
.LC4:
	.string	"unknown host x86"
	.section	.sbss,"aw",@nobits
	.align	2
	.type	threads, @object
	.size	threads, 4
threads:
	.zero	4
	.ident	"GCC: (GNU) 7.2.0"
