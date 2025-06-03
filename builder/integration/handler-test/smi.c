// SPDX-License-Identifier: GPL-2.0
/*
 * A module for MM payload testing.
 *
 * Copyright (c) 2025 9elements GmbH
 *
 * Author: Michal Gorlas <michal.gorlas@9elements.com>
 */

#include <linux/module.h>
#include <linux/init.h>
#include <linux/io.h>

#define APM_CNT 0xb2
#define APM_CNT_ACPI_DISABLE	0x1e
#define APM_CNT_ACPI_ENABLE	0xe1
#define APM_CNT_SMMSTORE	0xed
#define APM_CNT_PAYLOAD_MM	0xee

static int trigger_smi(u64 cmd, u64 arg, u64 retry)
{
	u64 status;
	u16 apmc = APM_CNT;

	asm volatile("movq	%[cmd],  %%rax\n\t"
		     "movq   %%rax,	%%rcx\n\t"
		     "movq	%[arg],  %%rbx\n\t"
		     "movq   %[retry],  %%r8\n\t"
		     ".trigger:\n\t"
		     "mov	%[apmc_port], %%dx\n\t"
		     "outb	%%al, %%dx\n\t"
		     "cmpq	%%rcx, %%rax\n\t"
		     "jne .return_changed\n\t"
		     "pushq  %%rcx\n\t"
		     "movq   $10000, %%rcx\n\t"
		     "rep    nop\n\t"
		     "popq   %%rcx\n\t"
		     "cmpq   $0, %%r8\n\t"
		     "je     .return_not_changed\n\t"
		     "decq   %%r8\n\t"
		     "jmp    .trigger\n\t"
		     ".return_changed:\n\t"
		     "movq	%%rax, %[status]\n\t"
		     "jmp	.end\n\t"
		     ".return_not_changed:"
		     "movq	%%rcx, %[status]\n\t"
		     ".end:\n\t"
		     : [status] "=r"(status)
		     : [cmd] "r"(cmd), [arg] "r"(arg), [retry] "r"(retry),
		       [apmc_port] "r"(apmc)
		     : "%rax", "%rbx", "%rdx", "%rcx", "%r8");

	if (status == cmd)
		status = 1;
	else
		status = 0;

	return status;
}


static int __init smm_sanity_check_init(void)
{
	outb(APM_CNT_ACPI_ENABLE, APM_CNT);
	outb(APM_CNT_ACPI_DISABLE, APM_CNT);
	outb(APM_CNT_SMMSTORE, APM_CNT);	
	outb(0x00, APM_CNT);
	

	u64 fake_ep = 0x200000;
	u64 cmd = APM_CNT_PAYLOAD_MM | (2 << 8);
	trigger_smi(cmd, fake_ep, 1);

	return 0;
}

static void __exit smm_sanity_check_exit(void) { }

module_init(smm_sanity_check_init);
module_exit(smm_sanity_check_exit);

MODULE_AUTHOR("Michal Gorlas <michal.gorlas@9elements.com>");
MODULE_DESCRIPTION("SMM sanity check for after boot");
MODULE_LICENSE("GPL v2");
