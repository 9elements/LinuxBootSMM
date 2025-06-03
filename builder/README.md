# LinuxbootSMM Builder
[![Go Report Card](https://goreportcard.com/badge/github.com/9elements/LinuxBootSMM/builder)](https://goreportcard.com/report/github.com/9elements/LinuxbootSMM/builder)
[![GoDoc](https://godoc.org/github.com/micgor32/linuxbootsmm-builder?status.svg)](https://godoc.org/github.com/micgor32/linuxbootsmm-builder)

A simple script to build coreboot image with LinuxBootSMM as a payload.

Based on [corebootnerf](https://github.com/linuxboot/corebootnerf).

## Prerequisites
Please make sure you have Go >= 1.23, and your GOPATH is set up correctly.
When installing dependencies, the script assumes that it is being run on
either Arch Linux, Fedora or Debian/Ubuntu.

## Usage
Install using go:
```sh
go install github.com/9elements/LinuxbootSMM/builder@latest
```
Check whether you have all dependencies mentioned [here](https://doc.coreboot.org/tutorial/part1.html#step-1-install-tools-and-libraries-needed-for-coreboot) installed, or run:
```sh
linuxbootsmm-builder --depinstall
```
For the remaining usage options please see:
```sh
Usage of linuxbootsmm-builder:
      --b string         Target architecture for coreboot (default "32")
      --blobs string     Path to the custom site-local directory for coreboot (default "no")
      --build            Only build the image
      --config string    Path to config file for coreboot (default "default")
      --smp              Compile Linux with SMP support
      --depinstall       Install all dependencies
      --fetch            Fetch all the things we need
      --testing int      Compile LinuxBootSMM for integration tests scenarios
```
If no custom `site-local` is provided (i.e. no `--blobs` specified), the builder will create empty one in which the kernel image and initramfs are going to be placed after compilation. 
Please also note that when using default config, builder script assumes that it is being run under in `/tmp`!
For more details about creating custom configs for different platforms, please refer to the [wiki page](https://github.com/9elements/LinuxBootSMM/wiki/Building-and-usage).

## Example usage - QEMU Q35
In order to build an example of coreboot+LinuxBootSMM, one can use QEMU emulator:
```sh
# Without SMP
cd /tmp
linuxbootsmm-builder --fetch --config q35
cd coreboot-git/
qemu-system-x86_64 -bios build/coreboot.rom -M q35 -serial stdio

# With SMP
cd /tmp
linuxbootsmm-builder --fetch --config q35-smp
cd coreboot-git/
qemu-system-x86_64 -bios build/coreboot.rom -M q35 -serial stdio -smp NUM_CPUS
```

