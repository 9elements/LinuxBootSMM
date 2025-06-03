# Integration tests

This directory contains tests for LinuxBootSMM. There are three main things that are being tested 
under different scenarios:
 - whether the code loaded by the Linux driver is indeed being executed in SMM context,
 - whether none of the driver's code is executed if one of the potential edge cases occur,
 - and whether the driver correctly identifies the requested SMI subcommands.

 The setup of this tests is highly inspired by [u-root integration tests](https://github.com/u-root/u-root/tree/main/integration),
 and rely on [vmtest API](https://github.com/hugelgupf/vmtest).


## Tests scenarios
The tests are designed to test the following scenarios:
 1. Normal boot with LinuxBootSMM:
 as an addition to the normal boot, the out-of-tree kernel module is loaded. It sends five SMI's:
    - ACPI enabling request
    - ACPI disabling request
    - MM variable store trigger (not implemented yet in the handler, will just return)
    - an SMI with empty (and hence invalid) subcommand.
    - an SMI triggering entry point registation (i.e. a try of replacing current handler)

 2. Signature missmatch in the memory buffer shared between LinuxBootSMM and coreboot:
 loader informs coreboot about the address of the payload's owned SMI handler (somewhere in lower 4GB of memory, determined dynamically on the runtime),
 coreboot (in SMM context) looks for a signature of the payload's SMI handler under given address (plus predefined offset). If the signature does not match,
 the procedure of installing payload's SMI handler is aborted. This missmatch is triggered on purpose in this test case.

 3. Signature missmatch in SMRAM:
 once the payload's SMI handler is already loaded in SMRAM, coreboot is supposed to calculate the entry point based on the offsets shared in the handler's header.
 Beforehand, however, it checks again for signature missmatch to ensure that the handler was indeed copied from the shared memory buffer. This missmatch is triggered
 on purpose in this test case.

There are 3 coreboot images that are being tested:
 - *coreboot_normal.rom*
 - *coreboot_shared_signature.rom*
 - *coreboot_smram_signature.rom*

The prebuilt images are placed in [images/](images/) directory. All of the images can be reproduced by running `linuxbootsmm-builder --fetch --config q35 --testing [1-3] --b [32/64]`.
Patches applied on the testing images are placed in [testing_patches](testing_patches/), and the out-of-tree kernel module in [handler-test](handler-test).
