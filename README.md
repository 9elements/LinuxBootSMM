# Transitioning SMM Ownership to Linuxboot

This repo contains the background of the problem, results of the research on existing implementations in coreboot and EDK2, and the design of the proposed solution.

## Tables of contents
 - [Background on SMM](#back)
 - [Overview of coreboot SMM implementation](#cb)
 - [Overview of EDK2 SMM implementation](#edk2)
 - [Roadmap](#road)
 - [Proposed design architecture](#prop)
 - [References](#refs)

## Background on SMM {#back}
System Management Mode (SMM) is a special purpose mode for handling the system-wide functions, intended to be used only by system firmware, hence not accessible for the operating system or its applications. [[1]](#1)\
SMM can be only invoked through System Management Interrupt (SMI) - either through SMI# pin on the processor or through a SMI message via APIC bus. SMI is nonmaskable, that is, it cannot be disabled/ignored by the processor,
and operates independently from the processor's interrupt and exception handling. When SMI is received, the processor saves the current context in SMRAM, enters SMM and starts executing the SMI handler. P


## Overview of coreboot SMM implementation {#cb}

## Overview of EDK2 SMM implementation {#edk2}

## Roadmap {#road}

## Proposed design architecture {#prop}

## References {#refs}
<a id="1">[1]</a> [Intel® 64 and IA-32 Architectures Software Developer Manuals, Volume 3C, Ch. 33](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)
