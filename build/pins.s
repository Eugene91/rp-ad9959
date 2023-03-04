	.file	"pins.c"
	.text
	.globl	SYS_FREQ
	.section	.rodata
	.align 8
	.type	SYS_FREQ, @object
	.size	SYS_FREQ, 8
SYS_FREQ:
	.quad	500000000
	.globl	IOUPDATE
	.data
	.align 4
	.type	IOUPDATE, @object
	.size	IOUPDATE, 4
IOUPDATE:
	.long	22
	.globl	DINP3
	.align 4
	.type	DINP3, @object
	.size	DINP3, 4
DINP3:
	.long	14
	.globl	DINP2
	.align 4
	.type	DINP2, @object
	.size	DINP2, 4
DINP2:
	.long	21
	.globl	DINP1
	.align 4
	.type	DINP1, @object
	.size	DINP1, 4
DINP1:
	.long	13
	.globl	DINP0
	.align 4
	.type	DINP0, @object
	.size	DINP0, 4
DINP0:
	.long	20
	.globl	CS
	.align 4
	.type	CS, @object
	.size	CS, 4
CS:
	.long	12
	.globl	SCLK
	.align 4
	.type	SCLK, @object
	.size	SCLK, 4
SCLK:
	.long	19
	.globl	SDIO0
	.align 4
	.type	SDIO0, @object
	.size	SDIO0, 4
SDIO0:
	.long	11
	.globl	SDIO1
	.align 4
	.type	SDIO1, @object
	.size	SDIO1, 4
SDIO1:
	.long	18
	.globl	SDIO3
	.align 4
	.type	SDIO3, @object
	.size	SDIO3, 4
SDIO3:
	.long	10
	.globl	SDIO2
	.align 4
	.type	SDIO2, @object
	.size	SDIO2, 4
SDIO2:
	.long	17
	.globl	MASTER_RESET
	.align 4
	.type	MASTER_RESET, @object
	.size	MASTER_RESET, 4
MASTER_RESET:
	.long	9
	.ident	"GCC: (GNU) 12.2.1 20230111"
	.section	.note.GNU-stack,"",@progbits
