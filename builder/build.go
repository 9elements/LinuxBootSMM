// Copyright 2012-2018 the u-root Authors,
// Copyright 2025 9elements.
// All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	"fmt"
	"github.com/go-ini/ini"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
	"strconv"
	"flag"

	cp "github.com/otiai10/copy"
)

type Patch int64

const (
	coreboot Patch = 0
	linux    Patch = 1
	tests    Patch = 2
)

var (
	configTxt = `loglevel=1
	init=/init
rootwait
`
	deps        = flag.Bool("depinstall", false, "Install all dependencies")
	fetch       = flag.Bool("fetch", false, "Fetch all the things we need")
	build       = flag.Bool("build", false, "Only build the image (you have to provide Linux image and initramfs)")
	configPath  = flag.String("config", "default", "Path to config file for coreboot")
	smpEnabled  = flag.Bool("smp", false, "Compile Linux with SMP support")
	bitness     = flag.String("b", "32", "Target architecture for coreboot")
	corebootVer = "git" // hardcoded for now, we only need it to avoid situation when someone have "coreboot" dir already, we do not want to overwrite it
	blobsPath   = flag.String("blobs", "no", "Path to the custom site-local directory for coreboot")
	testing     = flag.Int("testing", 0, "Compile LinuxBootSMM for integration tests scenarios")
	threads     = runtime.NumCPU() + 4 // Number of threads to use when calling make.
	// based on coreboot docs requirements
	packageListDebian = []string{
		"bison",
		"git",
		"golang",
		"build-essential",
		"curl",
		"gnat",
		"flex",
		"gnat",
		"libncurses-dev",
		"libssl-dev",
		"zlib1g-dev",
		"pkgconf",
		"qemu-system-x86",
	}
	packageListArch = []string{
		"base-devel",
		"curl",
		"git",
		"gcc-ada",
		"ncurses",
		"zlib",
		"qemu-full",
	}
	packageListRedhat = []string{
		"git",
		"make",
		"gcc-gnat",
		"flex",
		"bison",
		"xz",
		"bzip2",
		"gcc",
		"g++",
		"ncurses-devel",
		"wget",
		"zlib-devel",
		"patch",
		"qemu",
	}
	patchesCoreboot = []string{
		"0001-drivers-payload_mm_interface-Add-payload-MM-config-s.patch",
		"0002-drivers-payload_mm_interface-Implement-payload-MM-co.patch",
		"0003-cpu-x86-smm-Add-SMM-implementations-of-smm_-region.patch",
		"0004-cpu-x86-smm-Conditionally-reserve-an-SMRAM-area-for-.patch",
		"0005-fix-Kconfig-for-MM-payload-from-later-patches.patch",
		"0006-drivers-payload_mm_interface-implement-no-unlock-MM-.patch",
		"0007-mb-emulation-qemu-q35-hook-up-LinuxBoot-MM-to-SMI-ha.patch",
	}
	patchesLinux = []string{
		"0001-drivers-firmware-add-passing-MM-payload-info-from-co.patch",
		"0002-drivers-firmware-add-kernel-owned-SMI-handler.patch",
		"0003-drivers-firmware-loader-for-kernel-owned-SMI-handler.patch",
		"0004-driver-firmware-ACPI-management-in-SMI-handler.patch",
	}
	patchesTesting = []string{}
)

func patch(target Patch) error {
	switch target {
	case coreboot:
		var repoURL = "https://raw.githubusercontent.com/9elements/LinuxBootSMM/refs/heads/main/poc/patches/coreboot/"
		for _, patchName := range patchesCoreboot {
			url := repoURL + patchName
			cmd := exec.Command("wget", url)
			cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
			cmd.Dir = "coreboot-" + corebootVer
			if err := cmd.Run(); err != nil {
				fmt.Printf("obtaining patch failed %v", err)
				return err
			}

			cmd = exec.Command("git",  "am", patchName)
			cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
			cmd.Dir = "coreboot-" + corebootVer
			if err := cmd.Run(); err != nil {
				fmt.Printf("applying patch failed %v", err)
				return err
			}
		}
	case linux:
		var repoURL = "https://raw.githubusercontent.com/9elements/LinuxBootSMM/refs/heads/main/poc/patches/linux/"
		for _, patchName := range patchesLinux {
			url := repoURL + patchName
			cmd := exec.Command("wget", url)
			cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
			cmd.Dir = "linux-smm"
			if err := cmd.Run(); err != nil {
				fmt.Printf("obtaining patch failed %v", err)
				return err
			}

			cmd = exec.Command("git", "am", patchName)
			cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
			cmd.Dir = "linux-smm"
			if err := cmd.Run(); err != nil {
				fmt.Printf("applying patch failed %v", err)
				return err
			}
		}
	case tests:
		if *testing == 2 {
			var noLockNoRegPatch = []string{"https://raw.githubusercontent.com/9elements/LinuxBootSMM/refs/heads/main/builder/integration/testing_patches/0001-drivers-payload_mm_interface-triggering-test-case-fo.patch"}
			cmd := exec.Command("wget", noLockNoRegPatch...)
			cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
			cmd.Dir = "coreboot-" + corebootVer
			if err := cmd.Run(); err != nil {
				fmt.Printf("obtaining patch failed %v", err)
				return err
			}

			fmt.Printf("--------  Patching coreboot for tests\n")
			var applyNoLockNoReg = []string{"am", "0001-drivers-payload_mm_interface-triggering-test-case-fo.patch"}
			cmd = exec.Command("git", applyNoLockNoReg...)
			cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
			cmd.Dir = "coreboot-" + corebootVer
			if err := cmd.Run(); err != nil {
				fmt.Printf("applying patch failed %v", err)
				return err
			}
		} else if *testing == 3 {
			var noUnlockPatch = []string{"https://raw.githubusercontent.com/9elements/LinuxBootSMM/refs/heads/main/builder/integration/testing_patches/0002-drivers-payload_mm_interface-triggering-post-ep-check.patch"}
			cmd := exec.Command("wget", noUnlockPatch...)
			cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
			cmd.Dir = "coreboot-" + corebootVer
			if err := cmd.Run(); err != nil {
				fmt.Printf("obtaining patch failed %v", err)
				return err
			}

			fmt.Printf("--------  Patching coreboot for tests\n")
			var applyNoUnlock = []string{"am", "0002-drivers-payload_mm_interface-triggering-post-ep-check.patch"}
			cmd = exec.Command("git", applyNoUnlock...)
			cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
			cmd.Dir = "coreboot-" + corebootVer
			if err := cmd.Run(); err != nil {
				fmt.Printf("applying patch failed %v", err)
				return err
			}
		}
	default:
		return fmt.Errorf("target not found")
	}
	return nil
}

func getGitVersion() error {
	var args = []string{"clone", "https://review.coreboot.org/coreboot.git", "coreboot-" + corebootVer}
	fmt.Printf("-------- Getting the coreboot via git %v\n", args)
	cmd := exec.Command("git", args...)
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	if err := cmd.Run(); err != nil {
		fmt.Printf("didn't clone coreboot %v\n", err)
		return err
	}

	return nil
}

func restoreDefconfig() error {
	if _, err := os.Stat("coreboot-" + corebootVer + "/defconfig.bak"); err != nil {
		return nil
	}
	
	if err := cp.Copy("coreboot-"+corebootVer+"/defconfig.bak", "coreboot-"+corebootVer+"/defconfig"); err != nil {
			return err
	}

	return nil
}

func corebootDefconfig() error {
	if *testing != 0 {
		if err := cp.Copy("coreboot-"+corebootVer+"/defconfig", "coreboot-"+corebootVer+"/defconfig.bak"); err != nil {
			return err
		}

		f, err := os.OpenFile("coreboot-"+corebootVer+"/defconfig", os.O_APPEND|os.O_WRONLY, 0644)

		if err != nil {
			return err
		}

		defer f.Close()

		if _, err := f.WriteString("CONFIG_LINUXBOOT_UROOT_FILES=\"site-local/smi.ko:smi.ko\"\nCONFIG_SPECIFIC_BOOTLOADER_CUSTOM=y\nCONFIG_SPECIFIC_BOOTLOADER_CUSTOM_CMD=\"'insmod ./smi.ko'\""); err != nil {
			return err
		}
	} else {
		if err := restoreDefconfig(); err != nil {
			return err
		}
	}

	cmd := exec.Command("make", "defconfig", "KBUILD_DEFCONFIG=defconfig")
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	cmd.Dir = "coreboot-" + corebootVer
	if err := cmd.Run(); err != nil {
		fmt.Printf("generating config failed %v\n", err)
		return err
	}

	return nil
}


func corebootGet() error {
	cmd := exec.Command("make", "-j"+strconv.Itoa(threads), "crossgcc-i386", "CPUS=$(nproc)")

	getGitVersion()

	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	cmd.Dir = "coreboot-" + corebootVer
	if err := cmd.Run(); err != nil {
		fmt.Printf("toolchain build failed %v\n", err)
		return err
	}

	if *configPath == "default" {
		var config = []string{"-O", "defconfig", "https://raw.githubusercontent.com/9elements/LinuxBootSMM/refs/heads/main/builder/defconfig-raptorlake"}
		cmd = exec.Command("wget", config...)
		cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
		cmd.Dir = "coreboot-" + corebootVer
		if err := cmd.Run(); err != nil {
			fmt.Printf("obtaining config failed %v", err)
			return err
		}
	} else if *configPath == "q35" {
		// well this is dirty way, but anyways...
		var repoURL = ""
		if *bitness == "32" || *bitness == "64" {
			repoURL = "https://raw.githubusercontent.com/9elements/LinuxBootSMM/refs/heads/main/builder/defconfig-qemu" + *bitness
		} else {
			repoURL = "https://raw.githubusercontent.com/9elements/LinuxBootSMM/refs/heads/main/builder/defconfig-qemu" + *bitness
		}

		var config = []string{"-O", "defconfig", repoURL}
		cmd = exec.Command("wget", config...)
		cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
		cmd.Dir = "coreboot-" + corebootVer
		if err := cmd.Run(); err != nil {
			fmt.Printf("obtaining config failed %v\n", err)
			return err
		}
	} else {
		os.Link(*configPath, "coreboot-"+corebootVer+"/defconfig")
	}

	if *blobsPath != "no" {
		if err := cp.Copy(*blobsPath, "coreboot-"+corebootVer+"/site-local"); err != nil {
			fmt.Printf("copying custom site-local failed %v", err)
			return err
		}
	} else if !*build { // assume that --build was not run without first running --fetch
		newpath := filepath.Join("coreboot-"+corebootVer, "site-local")
		if err := os.MkdirAll(newpath, os.ModePerm); err != nil {
			fmt.Printf("error creating site-local %v\n", err)
			return err
		}
	}

	if err := patch(coreboot); err != nil {
		fmt.Printf("applying patches failed %v", err)
		return err
	}
	
	if *testing != 0 {
		if err := patch(tests); err != nil {
			fmt.Printf("applying patches failed %v", err)
			return err
		}
	}

	if err := corebootDefconfig(); err != nil {
		return err
	}

	return nil
}

func getKernel() error {
	var args = []string{"clone", "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git", "linux-smm"}
	cmd := exec.Command("git", args...)

	
	fmt.Printf("-------- Getting the kernel via git %v\n", args)
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	if err := cmd.Run(); err != nil {
		fmt.Printf("didn't cloned the kernel %v\n", err)
		//return err
	}
	patch(linux)

	if *smpEnabled {
		var config = []string{"-O", ".config", "https://raw.githubusercontent.com/micgor32/linuxbootsmm-builder/refs/heads/master/defconfig-linux-smp"}
		cmd = exec.Command("wget", config...)
		cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
		cmd.Dir = "linux-smm"
		if err := cmd.Run(); err != nil {
			fmt.Printf("obtaining config failed %v\n", err)
			return err
		}
	} else {
		var config = []string{"-O", ".config", "https://raw.githubusercontent.com/micgor32/linuxbootsmm-builder/refs/heads/master/defconfig-linux"}
		cmd = exec.Command("wget", config...)
		cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
		cmd.Dir = "linux-smm"
		if err := cmd.Run(); err != nil {
			fmt.Printf("obtaining config failed %v\n", err)
			return err
		}
	}

	fmt.Printf("-------- Writing defconfig \n")
	cmd = exec.Command("make", "olddefconfig")
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	cmd.Dir = "linux-smm"
	if err := cmd.Run(); err != nil {
		fmt.Printf("generating config failed %v\n", err)
		return err
	}

	return nil
}

func kernelBuild() error {
	fmt.Printf("--------  Building kernel\n")
	cmd := exec.Command("make", "-j"+strconv.Itoa(threads))
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	cmd.Dir = "linux-smm"
	if err := cmd.Run(); err != nil {
		fmt.Printf("error when builing the kernel %v", err)
		return err
	}

	if err := cp.Copy("linux-smm/arch/x86/boot/bzImage", "coreboot-"+corebootVer+"/payloads/external/LinuxBoot/build/Image"); err != nil {
		fmt.Printf("error copying the kernel image %v\n", err)
		return err
	}
	return nil
}

func includeTestingMod() error {
	var mod = []string{"https://github.com/9elements/LinuxBootSMM/raw/refs/heads/main/builder/integration/handler-test/smi.ko"}
	cmd := exec.Command("wget", mod...)
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	cmd.Dir = "coreboot-"+corebootVer+"/site-local"
	if err := cmd.Run(); err != nil {
		fmt.Printf("obtaining config failed %v\n", err)
		return err
	}

	if err := corebootDefconfig(); err != nil {
		return err
	}
	
	return nil
}

func resetTree() error {
	cmd := exec.Command("git",  "reset", "--hard", "origin/main")
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	cmd.Dir = "coreboot-" + corebootVer
	if err := cmd.Run(); err != nil {
		return err
	}
	
	return nil
}

func buildCoreboot() error {
	if _, err := os.Stat("coreboot-" + corebootVer + "/.config"); err != nil {
		return err
	}

	// sometimes cb build system behaves weirdly and skips u-root 
	// generation if initramfs exists (even tho we changed something with the config)
	cmd := exec.Command("make", "clean")
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	cmd.Dir = "coreboot-" + corebootVer
	if err := cmd.Run(); err != nil {
		fmt.Printf("cleaning failed %v\n", err) // "unicorn" case, no one ever saw it :D
		return err
	}


	// So at this point it is impossible to say how many patches are already applied,
	// it could be that someone ran --build --testing 2 and now wants 3rd test case, or
	// maybe clean build who knows. Safest way to deal with this (that I could think of
	// at the time being) is to reset to origin/main and reapply base patches + (if testing
	// is provided) additional ones.
	if err := resetTree(); err != nil {
		return err // another "unicorn" case
	}

	if err := patch(coreboot); err != nil {
		fmt.Printf("applying patches failed %v", err)
		return err
	}
	
	if *testing != 0 {
		if err := includeTestingMod(); err != nil {
			return err
		}
			
		if err := patch(tests); err != nil {
			fmt.Printf("applying testing patches failed %v", err)
			return err
		}
	} else { 
		if err := corebootDefconfig(); err != nil {
			return err
		}
	}

	cmd = exec.Command("make", "-j"+strconv.Itoa(threads))
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	cmd.Dir = "coreboot-" + corebootVer
	err := cmd.Run()
	if err != nil {
		return err
	}

	if _, err := os.Stat("coreboot-" + corebootVer + "/build/coreboot.rom"); err != nil {
		return err
	}
	fmt.Printf("build/coreboot.rom created\n")
	return nil
}

func run(name string, args ...string) error {
	cmd := exec.Command(name, args...)
	cmd.Stdout, cmd.Stderr = os.Stdout, os.Stderr
	if err := cmd.Run(); err != nil {
		return fmt.Errorf("%v %v: %v", name, args, err)
	}
	return nil
}

func check() error {
	if os.Getenv("GOPATH") == "" {
		return fmt.Errorf("You have to set GOPATH.\n")
	}
	return nil
}

func pacmaninstall() error {
	missing := []string{}
	for _, packageName := range packageListArch {
		cmd := exec.Command("pacman", "-Ql", packageName)
		if err := cmd.Run(); err != nil {
			missing = append(missing, packageName)
		}
	}

	if len(missing) == 0 {
		fmt.Println("No missing dependencies to install")
		return nil
	}

	fmt.Printf("Using pacman to get %v\n", missing)
	get := []string{"pacman", "-S", "--noconfirm"}
	get = append(get, missing...)
	cmd := exec.Command("sudo", get...)
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	return cmd.Run()
}

func dnfinstall() error {
	missing := []string{}
	for _, packageName := range packageListRedhat {
		cmd := exec.Command("dnf", "info", packageName)
		if err := cmd.Run(); err != nil {
			missing = append(missing, packageName)
		}
	}

	if len(missing) == 0 {
		fmt.Println("No missing dependencies to install")
		return nil
	}

	fmt.Printf("Using dnf to get %v\n", missing)
	get := []string{"dnf", "-y", "install"}
	get = append(get, missing...)
	cmd := exec.Command("sudo", get...)
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	return cmd.Run()
}

func aptget() error {
	missing := []string{}
	for _, packageName := range packageListDebian {
		cmd := exec.Command("dpkg", "-s", packageName)
		if err := cmd.Run(); err != nil {
			missing = append(missing, packageName)
		}
	}

	if len(missing) == 0 {
		fmt.Println("No missing dependencies to install")
		return nil
	}

	fmt.Printf("Using apt-get to get %v\n", missing)
	get := []string{"apt-get", "-y", "install"}
	get = append(get, missing...)
	cmd := exec.Command("sudo", get...)
	cmd.Stdin, cmd.Stdout, cmd.Stderr = os.Stdin, os.Stdout, os.Stderr
	return cmd.Run()

}

func depinstall() error {
	cfg, err := ini.Load("/etc/os-release")
	if err != nil {
		fmt.Printf("Fail to read file: %v", err)
	}

	ConfigParams := make(map[string]string)
	ConfigParams["ID"] = cfg.Section("").Key("ID").String()
	osID := ConfigParams["ID"]

	switch osID {
	case "fedora":
		dnfinstall()
	case "rhel":
		dnfinstall()
	case "debian":
		aptget()
	case "ubuntu":
		aptget()
	case "arch":
		pacmaninstall()
	default:
		log.Fatal("No matching OS found\n")
	}

	return nil
}

func allFunc() error {
	var cmds = []struct {
		f      func() error
		skip   bool
		ignore bool
		n      string
	}{
		{f: depinstall, skip: !*deps, ignore: false, n: "Install dependencies"},
		{f: corebootGet, skip: *build || !*fetch, ignore: false, n: "Download coreboot"},
		{f: getKernel, skip: *build || !*fetch, ignore: false, n: "download kernel sources"},
		{f: kernelBuild, skip: *deps, ignore: false, n: "build kernel"},
		{f: buildCoreboot, skip: *deps, ignore: false, n: "build coreboot"},
	}

	for _, c := range cmds {
		log.Printf("-----> Step %v: ", c.n)
		if c.skip {
			log.Printf("-------> Skip")
			continue
		}
		log.Printf("----------> Start")
		err := c.f()
		if c.ignore {
			log.Printf("----------> Ignore result")
			continue
		}
		if err != nil {
			return fmt.Errorf("%v: %v", c.n, err)
		}
		log.Printf("----------> Finished %v\n", c.n)
	}
	return nil
}

func main() {
	flag.Parse()
	log.Printf("Using patched kernel for LinuxBootSMM\n")
	if err := allFunc(); err != nil {
		log.Fatalf("fail error is : %v", err)
	}
	log.Printf("execution completed successfully\n")
}
