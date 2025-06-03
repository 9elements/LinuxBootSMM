savedcmd_smi.ko := ld -r -m elf_x86_64 -z noexecstack --no-warn-rwx-segments --build-id=sha1  -T /home/micgor32/patches-prep/linux/scripts/module.lds -o smi.ko smi.o smi.mod.o .module-common.o
