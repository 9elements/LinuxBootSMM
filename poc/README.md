# Proof Of Concept
The working kernel source tree may be found [here](https://github.com/micgor32/linux).
Relevant paths are:
 - [`drivers/firmware/google/`](https://github.com/micgor32/linux/tree/master/drivers/firmware/google)
 - [`arch/x86/realmode/`](https://github.com/micgor32/linux/tree/master/arch/x86/realmode)

The patches [subdirectory](patches/) contains the ready to be applied patch on upstream Linux kernel.

## Current state
The driver is able to perform post-boot (that is after ramstage ends and payload stage starts) SMRAM unlocking, install
Linux-owned code in SMRAM, and lock SMRAM again before any additional SMIs start to arrive. For the design flow, please see
main [README](../README.md).

## Limitations and TODO
 - The "trampoline" code is not doing anything apart from acknowledging its existence in SMM and returning
 to the coreboot's SMI handler. The next step is to implement (in similar fashion to the Linux realmode trampoline)
 the code that preserves the registers (in whatever their status was in coreboot SMI handler), brings us up to the
 kernel space, and first then returns to the coreboot's SMI handler. This will allow to benefit from kernel memory 
 protection, and will give more freedom for implementing more features from the kernel space.
