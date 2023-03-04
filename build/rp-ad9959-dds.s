	.file	"rp-ad9959-dds.c"
	.text
	.p2align 4
	.globl	ad9959_init
	.type	ad9959_init, @function
ad9959_init:
.LFB25:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	MASTER_RESET(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	MASTER_RESET(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	MASTER_RESET(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	usleep@PLT
	.cfi_endproc
.LFE25:
	.size	ad9959_init, .-ad9959_init
	.p2align 4
	.globl	write_a_byte
	.type	write_a_byte, @function
write_a_byte:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$8, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L8:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L13
	xorl	%esi, %esi
.L13:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L8
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	write_a_byte, .-write_a_byte
	.p2align 4
	.globl	write_CSR
	.type	write_CSR, @function
write_CSR:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%esi, %esi
	movl	$8, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	SDIO3(%rip), %edi
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L15:
	movl	SDIO0(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L15
	movl	$8, %ebp
	.p2align 4,,10
	.p2align 3
.L19:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L25
	xorl	%esi, %esi
.L25:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L19
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	$1, %esi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	rp_DpinSetState@PLT
	.cfi_endproc
.LFE27:
	.size	write_CSR, .-write_CSR
	.p2align 4
	.globl	write_CFR
	.type	write_CFR, @function
write_CFR:
.LFB28:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$8, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	$3, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%edi, %r12d
	movl	SDIO3(%rip), %edi
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%esi, %ebp
	xorl	%esi, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%edx, %ebx
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L30:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%r13b, %r13b
	js	.L56
	xorl	%esi, %esi
.L56:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%r13d, %r13d
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r14b
	jne	.L30
	movl	$8, %r13d
	.p2align 4,,10
	.p2align 3
.L34:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%r12b, %r12b
	js	.L57
	xorl	%esi, %esi
.L57:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%r12d, %r12d
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r13b
	jne	.L34
	movl	$8, %r12d
	.p2align 4,,10
	.p2align 3
.L38:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L58
	xorl	%esi, %esi
.L58:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L38
	movl	$8, %ebp
	.p2align 4,,10
	.p2align 3
.L42:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L59
	xorl	%esi, %esi
.L59:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L42
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	popq	%rbx
	.cfi_def_cfa_offset 40
	movl	$1, %esi
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	rp_DpinSetState@PLT
	.cfi_endproc
.LFE28:
	.size	write_CFR, .-write_CFR
	.p2align 4
	.globl	write_FR1
	.type	write_FR1, @function
write_FR1:
.LFB29:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$8, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	$1, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%edi, %r12d
	movl	SDIO3(%rip), %edi
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%esi, %ebp
	xorl	%esi, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%edx, %ebx
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L64:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%r13b, %r13b
	js	.L90
	xorl	%esi, %esi
.L90:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%r13d, %r13d
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r14b
	jne	.L64
	movl	$8, %r13d
	.p2align 4,,10
	.p2align 3
.L68:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%r12b, %r12b
	js	.L91
	xorl	%esi, %esi
.L91:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%r12d, %r12d
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r13b
	jne	.L68
	movl	$8, %r12d
	.p2align 4,,10
	.p2align 3
.L72:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L92
	xorl	%esi, %esi
.L92:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L72
	movl	$8, %ebp
	.p2align 4,,10
	.p2align 3
.L76:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L93
	xorl	%esi, %esi
.L93:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L76
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	popq	%rbx
	.cfi_def_cfa_offset 40
	movl	$1, %esi
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	rp_DpinSetState@PLT
	.cfi_endproc
.LFE29:
	.size	write_FR1, .-write_FR1
	.p2align 4
	.globl	write_FR2
	.type	write_FR2, @function
write_FR2:
.LFB30:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$8, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$2, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%esi, %ebx
	xorl	%esi, %esi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	SDIO3(%rip), %edi
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L98:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%r12b, %r12b
	js	.L117
	xorl	%esi, %esi
.L117:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%r12d, %r12d
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r13b
	jne	.L98
	movl	$8, %r12d
	.p2align 4,,10
	.p2align 3
.L102:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L118
	xorl	%esi, %esi
.L118:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L102
	movl	$8, %ebp
	.p2align 4,,10
	.p2align 3
.L106:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L119
	xorl	%esi, %esi
.L119:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L106
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	$1, %esi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	rp_DpinSetState@PLT
	.cfi_endproc
.LFE30:
	.size	write_FR2, .-write_FR2
	.p2align 4
	.globl	write_CFTW0
	.type	write_CFTW0, @function
write_CFTW0:
.LFB31:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%esi, %esi
	movl	$8, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$4, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movl	SDIO3(%rip), %edi
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L124:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L157
	xorl	%esi, %esi
.L157:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L124
	movq	%rbx, %rbp
	movl	$8, %r12d
	shrq	$24, %rbp
	.p2align 4,,10
	.p2align 3
.L128:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L158
	xorl	%esi, %esi
.L158:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L128
	movq	%rbx, %rbp
	movl	$8, %r12d
	shrq	$16, %rbp
	.p2align 4,,10
	.p2align 3
.L132:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L159
	xorl	%esi, %esi
.L159:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L132
	movzbl	%bh, %eax
	movl	$8, %ebp
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L136:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%r12b, %r12b
	js	.L160
	xorl	%esi, %esi
.L160:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%r12d, %r12d
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L136
	movl	$8, %ebp
	.p2align 4,,10
	.p2align 3
.L140:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L161
	xorl	%esi, %esi
.L161:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L140
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	popq	%rbx
	.cfi_def_cfa_offset 24
	movl	$1, %esi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	rp_DpinSetState@PLT
	.cfi_endproc
.LFE31:
	.size	write_CFTW0, .-write_CFTW0
	.p2align 4
	.globl	set_frequency
	.type	set_frequency, @function
set_frequency:
.LFB32:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	testq	%rdi, %rdi
	js	.L163
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rdi, %xmm0
.L164:
	mulss	.LC0(%rip), %xmm0
	comiss	.LC1(%rip), %xmm0
	jnb	.L165
	cvttss2siq	%xmm0, %rbx
.L166:
	movl	SDIO3(%rip), %edi
	xorl	%esi, %esi
	movl	$8, %r12d
	movl	$4, %ebp
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L170:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L203
	xorl	%esi, %esi
.L203:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L170
	movq	%rbx, %rbp
	movl	$8, %r12d
	shrq	$24, %rbp
	.p2align 4,,10
	.p2align 3
.L174:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L204
	xorl	%esi, %esi
.L204:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L174
	movq	%rbx, %rbp
	movl	$8, %r12d
	shrq	$16, %rbp
	.p2align 4,,10
	.p2align 3
.L178:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L205
	xorl	%esi, %esi
.L205:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L178
	movzbl	%bh, %eax
	movl	$8, %ebp
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L182:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%r12b, %r12b
	js	.L206
	xorl	%esi, %esi
.L206:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%r12d, %r12d
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L182
	movl	$8, %ebp
	.p2align 4,,10
	.p2align 3
.L186:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L207
	xorl	%esi, %esi
.L207:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L186
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$1, %esi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L165:
	.cfi_restore_state
	subss	.LC1(%rip), %xmm0
	cvttss2siq	%xmm0, %rbx
	btcq	$63, %rbx
	jmp	.L166
	.p2align 4,,10
	.p2align 3
.L163:
	movq	%rdi, %rax
	andl	$1, %edi
	pxor	%xmm0, %xmm0
	shrq	%rax
	orq	%rdi, %rax
	cvtsi2ssq	%rax, %xmm0
	addss	%xmm0, %xmm0
	jmp	.L164
	.cfi_endproc
.LFE32:
	.size	set_frequency, .-set_frequency
	.p2align 4
	.globl	update
	.type	update, @function
update:
.LFB33:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	IOUPDATE(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	IOUPDATE(%rip), %edi
	movl	$1, %esi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	rp_DpinSetState@PLT
	.cfi_endproc
.LFE33:
	.size	update, .-update
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Red Pitaya API init failed!\n"
	.text
	.p2align 4
	.globl	add9959
	.type	add9959, @function
add9959:
.LFB34:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movslq	%edi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%esi, %ebx
	call	rp_Init@PLT
	testl	%eax, %eax
	jne	.L319
	movl	MASTER_RESET(%rip), %edi
	movl	$1, %esi
	movl	$8, %ebp
	call	rp_DpinSetDirection@PLT
	movl	SDIO3(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	SDIO2(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	SDIO1(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	DINP0(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	DINP1(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	DINP2(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	DINP3(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	IOUPDATE(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetDirection@PLT
	movl	MASTER_RESET(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	MASTER_RESET(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	MASTER_RESET(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SDIO3(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L212:
	movl	SDIO0(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L212
	movl	$8, %ebp
	.p2align 4,,10
	.p2align 3
.L216:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L308
	xorl	%esi, %esi
.L308:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L216
	movl	CS(%rip), %edi
	movl	$1, %esi
	movl	$8, %ebp
	movl	$1, %ebx
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L220:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L309
	xorl	%esi, %esi
.L309:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L220
	movl	$8, %ebp
	movl	$-48, %ebx
	.p2align 4,,10
	.p2align 3
.L224:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L310
	xorl	%esi, %esi
.L310:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L224
	movl	$8, %ebx
	.p2align 4,,10
	.p2align 3
.L225:
	movl	SDIO0(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bl
	jne	.L225
	movl	$8, %ebx
	.p2align 4,,10
	.p2align 3
.L226:
	movl	SDIO0(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bl
	jne	.L226
	movl	CS(%rip), %edi
	movl	$1, %esi
	movl	$8, %ebp
	movl	$2, %ebx
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L230:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L311
	xorl	%esi, %esi
.L311:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L230
	movl	$8, %ebx
	.p2align 4,,10
	.p2align 3
.L231:
	movl	SDIO0(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bl
	jne	.L231
	movl	$8, %ebx
	.p2align 4,,10
	.p2align 3
.L232:
	movl	SDIO0(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bl
	jne	.L232
	movl	CS(%rip), %edi
	movl	$1, %esi
	movl	$8, %ebp
	movl	$3, %ebx
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L236:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L312
	xorl	%esi, %esi
.L312:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L236
	movl	$8, %ebx
	.p2align 4,,10
	.p2align 3
.L237:
	movl	SDIO0(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bl
	jne	.L237
	movl	$8, %ebp
	movl	$3, %ebx
	.p2align 4,,10
	.p2align 3
.L241:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L313
	xorl	%esi, %esi
.L313:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L241
	movl	$8, %ebx
	.p2align 4,,10
	.p2align 3
.L242:
	movl	SDIO0(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bl
	jne	.L242
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	testq	%r12, %r12
	js	.L243
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%r12, %xmm0
.L244:
	mulss	.LC0(%rip), %xmm0
	comiss	.LC1(%rip), %xmm0
	jnb	.L245
	cvttss2siq	%xmm0, %rbx
.L246:
	movl	SDIO3(%rip), %edi
	xorl	%esi, %esi
	movl	$8, %r12d
	movl	$4, %ebp
	call	rp_DpinSetState@PLT
	movl	CS(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	.p2align 4,,10
	.p2align 3
.L250:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L314
	xorl	%esi, %esi
.L314:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L250
	movq	%rbx, %rbp
	movl	$8, %r12d
	shrq	$24, %rbp
	.p2align 4,,10
	.p2align 3
.L254:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L315
	xorl	%esi, %esi
.L315:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L254
	movq	%rbx, %rbp
	movl	$8, %r12d
	shrq	$16, %rbp
	.p2align 4,,10
	.p2align 3
.L258:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bpl, %bpl
	js	.L316
	xorl	%esi, %esi
.L316:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebp, %ebp
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %r12b
	jne	.L258
	movzbl	%bh, %eax
	movl	$8, %ebp
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L262:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%r12b, %r12b
	js	.L317
	xorl	%esi, %esi
.L317:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%r12d, %r12d
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L262
	movl	$8, %ebp
	.p2align 4,,10
	.p2align 3
.L266:
	movl	SDIO0(%rip), %edi
	movl	$1, %esi
	testb	%bl, %bl
	js	.L318
	xorl	%esi, %esi
.L318:
	call	rp_DpinSetState@PLT
	movl	SCLK(%rip), %edi
	movl	$1, %esi
	addl	%ebx, %ebx
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	SCLK(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	subb	$1, %bpl
	jne	.L266
	movl	CS(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	SDIO3(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	movl	IOUPDATE(%rip), %edi
	xorl	%esi, %esi
	call	rp_DpinSetState@PLT
	movl	$10, %edi
	call	usleep@PLT
	movl	IOUPDATE(%rip), %edi
	movl	$1, %esi
	call	rp_DpinSetState@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	rp_Release@PLT
	.p2align 4,,10
	.p2align 3
.L243:
	.cfi_restore_state
	movq	%r12, %rax
	andl	$1, %r12d
	pxor	%xmm0, %xmm0
	shrq	%rax
	orq	%r12, %rax
	cvtsi2ssq	%rax, %xmm0
	addss	%xmm0, %xmm0
	jmp	.L244
	.p2align 4,,10
	.p2align 3
.L319:
	movq	stderr(%rip), %rcx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$28, %edx
	movl	$1, %esi
	popq	%rbp
	.cfi_def_cfa_offset 16
	leaq	.LC2(%rip), %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	fwrite@PLT
	.p2align 4,,10
	.p2align 3
.L245:
	.cfi_restore_state
	subss	.LC1(%rip), %xmm0
	cvttss2siq	%xmm0, %rbx
	btcq	$63, %rbx
	jmp	.L246
	.cfi_endproc
.LFE34:
	.size	add9959, .-add9959
	.section	.rodata.str1.1
.LC3:
	.string	"help"
.LC4:
	.string	"Shows help."
.LC5:
	.string	"freq"
.LC6:
	.string	"Frequency value."
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"frequency in Hz between 200 000 000"
	.section	.rodata.str1.1
.LC8:
	.string	"ch"
.LC9:
	.string	"Channel value."
.LC10:
	.string	"from 0 to 3"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"No arguments are provided. See help by running program with -h option "
	.section	.rodata.str1.1
.LC12:
	.string	"add9959-dds-firmware: %s\n"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"Usage: add9959-dds-firmware [options] [--] [operands]\n\nOptions:"
	.section	.rodata.str1.1
.LC14:
	.string	"Wrong parameters values "
.LC15:
	.string	"frequency value: %d\n"
.LC16:
	.string	"channel value: %x\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB35:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$40, %ecx
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	leaq	freq.1(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	.LC5(%rip), %rbx
	subq	$336, %rsp
	.cfi_def_cfa_offset 368
	movq	dropt_handle_bool@GOTPCREL(%rip), %rdx
	movq	%fs:40, %rax
	movq	%rax, 328(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	rep stosq
	leaq	.LC4(%rip), %rax
	movq	%rdx, 32(%rsp)
	movq	%rsp, %rdi
	leaq	.LC3(%rip), %rcx
	movq	%rax, %xmm1
	movb	$104, (%rsp)
	leaq	showHelp.2(%rip), %rax
	movq	%rcx, %xmm0
	movq	%rax, 40(%rsp)
	leaq	.LC8(%rip), %rcx
	punpcklqdq	%xmm1, %xmm0
	movq	%rax, 104(%rsp)
	leaq	.LC6(%rip), %rax
	movq	%rax, %xmm2
	movups	%xmm0, 8(%rsp)
	leaq	.LC7(%rip), %rax
	movq	%rbx, %xmm0
	punpcklqdq	%xmm2, %xmm0
	movq	%rdx, 96(%rsp)
	leaq	.LC9(%rip), %rdx
	leaq	.LC10(%rip), %rbx
	movq	%rax, 152(%rsp)
	movq	dropt_handle_int@GOTPCREL(%rip), %rax
	movq	%rdx, %xmm3
	movups	%xmm0, 136(%rsp)
	movq	%rcx, %xmm0
	movq	%rax, 160(%rsp)
	punpcklqdq	%xmm3, %xmm0
	movq	%rax, 224(%rsp)
	leaq	ch.0(%rip), %rax
	movq	%rbx, 216(%rsp)
	movl	$1, 48(%rsp)
	movb	$63, 64(%rsp)
	movl	$3, 112(%rsp)
	movb	$102, 128(%rsp)
	movq	%rsi, 168(%rsp)
	movb	$99, 192(%rsp)
	movq	%rax, 232(%rsp)
	movups	%xmm0, 200(%rsp)
	call	dropt_new_context@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L321
	testl	%r12d, %r12d
	je	.L335
	orl	$-1, %esi
	movq	%rax, %rdi
	leaq	8(%rbp), %rdx
	call	dropt_parse@PLT
	movq	%rbx, %rdi
	call	dropt_get_error@PLT
	testl	%eax, %eax
	jne	.L336
	cmpb	$0, showHelp.2(%rip)
	jne	.L337
	movl	freq.1(%rip), %esi
	leal	-1(%rsi), %eax
	cmpl	$199999999, %eax
	ja	.L327
	cmpl	$3, ch.0(%rip)
	jbe	.L328
.L327:
	leaq	.LC14(%rip), %rdi
	movl	$1, %ebp
	call	puts@PLT
	jmp	.L320
.L335:
	leaq	.LC11(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
.L323:
	xorl	%ebp, %ebp
.L326:
	movq	%rbx, %rdi
	call	dropt_free_context@PLT
.L320:
	movq	328(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L338
	addq	$336, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L337:
	.cfi_restore_state
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	movq	stdout(%rip), %rdi
	xorl	%edx, %edx
	movq	%rbx, %rsi
	call	dropt_print_help@PLT
	jmp	.L323
.L336:
	movq	%rbx, %rdi
	call	dropt_get_error_message@PLT
	movq	stderr(%rip), %rdi
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	fprintf@PLT
.L321:
	movl	$1, %ebp
	jmp	.L326
.L328:
	leaq	.LC15(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	ch.0(%rip), %esi
	leaq	.LC16(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	ch.0(%rip), %esi
	movl	freq.1(%rip), %edi
	sall	$4, %esi
	call	add9959
	jmp	.L323
.L338:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE35:
	.size	main, .-main
	.local	ch.0
	.comm	ch.0,4,4
	.data
	.align 4
	.type	freq.1, @object
	.size	freq.1, 4
freq.1:
	.long	10000000
	.local	showHelp.2
	.comm	showHelp.2,1,1
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
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1091137631
	.align 4
.LC1:
	.long	1593835520
	.ident	"GCC: (GNU) 12.2.1 20230111"
	.section	.note.GNU-stack,"",@progbits
