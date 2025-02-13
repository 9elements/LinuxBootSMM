# Transitioning SMM Ownership to Linuxboot

This repo contains the background of the problem, results of the research on existing implementations in coreboot and EDK2, the design of the proposed solution, and its implementation (PoC). 

## Tables of contents
 - [Background on SMM](#background-on-smm)
 - [Overview of coreboot SMM initialization](#overview-of-coreboot-smm-initialization)
 - [Overview of EDK2 SMM initialization](#overview-of-edk2-smm-initialization)
 - [WIP: Roadmap](#roadmap)
 - [WIP: Proposed design architecture](#proposed-design-architecture)
 - [WIP: Proof of Concept](#proof-of-concept)
 - [References](#references)

## Background on SMM
System Management Mode (SMM) is a special purpose mode for handling the system-wide functions, intended to be used only by system firmware, hence not accessible for the operating system or its applications. \
SMM can be only invoked through System Management Interrupt (SMI) - either through SMI# pin on the processor or through a SMI message via APIC bus. SMI is nonmaskable, that is, it cannot be disabled/ignored by the processor,
and operates independently from the processor's interrupt and exception handling. When SMI is received, the processor saves the current context in SMRAM, enters SMM and starts executing the SMI handler. Once in SMM, the processor signals
external hardware about handling SMI, the implementation of signaling is platform dependent and hence omitted here. Exiting from SMM can only be done by executing RSM instruction, available to the SMI handler. RSM
restores the previous processor's context back to the registers from the save state image from the SMRAM. Please note that the description given here is brief, for detailed description, please refer to Intel's developer manual for IA-32/64
architecture, (Volume 3C, Chapter 33) [[1]](#1). 
### SMRAM
The above mentioned SMRAM is a address space to which the processor switches when entering SMM. All memory addresses become mapped to the low 4GB's of the physical address space. The critical code and data of SMI handler 
resides in SMRAM. There is a pre-defined region within SMRAM - the State Save Area - where the per-SMI context is saved. The default size of SMRAM is 64 KB starting from the physical address called SMBASE. The SMBASE default value is 30000H, and 
the State Save Area is stored from SMBASE + FE00H to SMBASE + FFFFH. The processor looks for the SMI handler instructions at addresses starting from SMBASE + 8000H. In general, the size of SMRAM can be between 32KB and 4GB. For the details on registers
stored in State Save Area, please refer to Intel's developer manual for IA-32/64 architecture, (Volume 3C, Chapter 33.4) [[1]](#1). When running on multiprocessor systems, each processor needs its own SMRAM space, and while there can be an overlap of the memory space,
each processor needs its own State Save Area. There are no restrictions on how many processors can excute in SMM at given time.

## [WIP] Overview of coreboot SMM initialization
coreboot, if build for x86, takes care of initializing SMM. When HAVE_SMI_HANDLER is set to "y" (which is the case for most of the supported x86 boards), source files responsible for SMM init ```src/cpu/x86/smm``` are compiled as part of ramstage class [[2]](#2), [[3]](#3).
The ramstage is one of the multiple coreboot stages that are each compiled as separate binaries and compressed into CBFS. ramstage is responsible for main device init, so i.a. SMM init [[4]](#4).
The ```src/cpu/x86/smm``` consists of:
 - **save_state.c** - defines 4 functions:
    - ```init_save_state()```: initializes the save state (TODO: vague description, write the proper flow of the func)
    - ```get_apmc_node(u8 cmd)```: returns the CPU node which issued an APMC IO write (Advanced Power Management Control register).
    - accessors for SMM save state CPU registers RAX, RBX, RCX and RDX [[5]](#5), ```get_save_state_reg(const enum cpu_reg reg, const int node, void *out, const uint8_t length)``` and ```get_save_state_reg(const enum cpu_reg reg, const int node, void *out, const uint8_t length)```.
 - **smm_module_handler.c** - C-based SMM runtime handler which consists of the following functions:
    - ```smi_obtain_lock()```: fuction to aquire lock to ensure only one processor can execute the handler.
    - ```smi_release_lock()```: used to release the previously aquired lock.
    - ```smm_get_smmstore_com_buffer(uintptr_t *base, size_t *size)```: getter for the location of the SMMSTORE (see section on [SMMSTORE](#smmstore)).
    - ```smm_get_cbmemc_buffer(void **buffer_out, size_t *size_out)```: getter for the location of the CBMEM Console buffer [[6]](#6) in SMM mode.
    - ```is_trap_handler(int smif)```: a handler for IO trap which passes the handling of IO trap to appropriate handler for given SoC through `mainboard_io_trap_handler(int smif)` and returns non-zero value if this handler function handled given IO trap without errors
    - ```smi_backup_pci_address```: backing up PCI address under u32 int variable pci_orig in case OS needs it later.
    - ```smi_restore_pci_address()```: restore previously backed up PCI address.
    - ```*smm_get_save_state(int cpu)```: getter for save state of given processor.
    - ```smm_revision()```: retuns the SMM save state Revision from the SMM save state, which is alwazs at the same pre-defined offset downward from the top of the save state, that is: ```save_state + save_state_size - SMM_REVISION_OFFSET_FROM_TOP```.
    - ```smm_region_overlaps_handler(const struct region *r)```: for checking whether region pointed to by `r` overlaps with the memory reserved for SMM.
    - ```smm_handler_start(void *arg)```: 
 - **smm_module_loader.c** - 
 - **smm_stub.S** - a generic wrapper for bootstrapping a C-based SMM handler, it puts the CPU into the protected mode with a stack and calls into the C handler (smm_module_handler.c)
 - **tseg_region.c** - used for aligning the region in the Top of Low Memory Segment (TSEG) for SMM. Based on the values of SMM_TSEG and SMM_ASEG from the build configuration, the start and size of the region are alligned for either TSEG or ASEG. Note that ASEG is deprecated and only used for QEMU emulation target.
 - **pci_resource_store.c** - compiled if SMM_PCI_RESOURCE_STORE is set to "y" - not the case by default, currently only enabled for Intel Xeon SP SoC's and AMD SoC's that require AMD common XHCI support. Support for storing PCI resources in SMRAM allows SMM to tell whether they have been altered. Functions defined
 here are:
    - ```smm_pci_resource_store_init(struct smm_runtime *smm_runtime)```: initializes PCI store within runtime
    - ```smm_pci_resource_store_fill_resources(struct smm_pci_resource_info *slots, size_t num_slots, const struct device **devices, size_t num_devices)```: stores the devices info within the PCI resource store
    - ```smm_pci_get_stored_resources(const volatile struct smm_pci_resource_info **out_slots, size_t *out_size)```: getter function for stored info

### Updating Multiprocessor (MP) tables


### SMMSTORE
SMMSTORE, or SMMSTOREv2, are SMM mediated drivers to read from write to and erase a predefined region in the flash. This can be used by the OS or the payload to implement persistent storage to hold for instance configuration data, without needing to implement a (platform specific) storage driver in the payload itself.
For more details about actual implementation of SMMSTORE and SMMSTOREv2, we refer to coreboot's documentation [[7]](#), [[8]](#). In practice SMMSTORE(/v2) is used if coreboot is built with EDK2 as payload. Such configuration uses UEFI Secureboot, which relies on Authenticated SMM variable to store Secureboot Keys [[9]](#9).
TODO: finish up this section.

## [WIP] Overview of EDK2 SMM initialization

## Roadmap
Please see [LinuxBootSMM roadmap](https://github.com/orgs/9elements/projects/35).

## [WIP] Proposed design architecture

## [WIP] Proof of Concept

## References
<a id="1">[1]</a> [Intel® 64 and IA-32 Architectures Software Developer Manuals, Volume 3C, Ch. 33](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html) \
<a id="2">[2]</a> [Linux Kernel Makefiles](https://www.kernel.org/doc/html/v6.14-rc1/kbuild/makefiles.html) \
<a id="3">[3]</a> [The coreboot build system](https://doc.coreboot.org/getting_started/build_system.html) \
<a id="4">[4]</a> [coreboot architecture - ramstage](https://doc.coreboot.org/getting_started/architecture.html#ramstage) \
<a id="5">[5]</a> [Intel® 64 and IA-32 Architectures Software Developer Manuals, Volume 1, Ch. 3.](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html) \
<a id="6">[6]</a> [coreboot FAQ - What does coreboot leave in memory after it's done initializing the hardware](https://doc.coreboot.org/getting_started/faq.html#what-does-coreboot-leave-in-memory-after-it-s-done-initializing-the-hardware) \
<a id="7">[7]</a> [SMM based flash storage driver](https://doc.coreboot.org/drivers/smmstore.html) \
<a id="8">[8]</a> [SMM based flash storage driver version 2](https://doc.coreboot.org/drivers/smmstorev2.html) \
<a id="9">[9]</a> [A Tour Beyond BIOS Implementing UEFI Authenticated Variables in SMM with EDKII](https://raw.githubusercontent.com/tianocore-docs/Docs/master/White_Papers/A_Tour_Beyond_BIOS_Implementing_UEFI_Authenticated_Variables_in_SMM_with_EDKII_V2.pdf) \
