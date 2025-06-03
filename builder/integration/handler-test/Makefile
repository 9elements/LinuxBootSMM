# SPDX-License-Identifier: GPL-2.0

obj-m += smi.o

KDIR  := /tmp/linux-smm # assuming that this will be run from the builder script
PWD   := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	rm -f *.mod
	rm -f *.mod.*
	rm -f *.ko
	rm -f *.o
	rm -f modules.order
	rm -f Module.symvers
help:
	@echo "Available targets:"
	@echo "  default      - Build all targets"
	@echo "	 clean	      - Clean up the source tree"
	@echo "  help         - Show this help message"
