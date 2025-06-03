// Copyright 2025 9elements. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package integration

import (
	"os"
	"testing"
	"time"

	"github.com/Netflix/go-expect"
	"github.com/hugelgupf/vmtest/qemu"
)

func TestNormalBoot(t *testing.T) {
	path, err := os.Getwd()

	if err != nil {
		t.Fatalf("working dir not found: %v", err)
	}

	vm, err := qemu.Start(
		qemu.ArchAMD64,
		qemu.WithQEMUCommand("qemu-system-x86_64 -bios "+path+"/images/coreboot_normal_x86_64.rom -M q35"),
		//qemu.LogSerialByLine(qemu.DefaultPrint("vm", t.Logf)),
		qemu.WithVMTimeout(20*time.Second),
	)

	if err != nil {
		t.Fatalf("Failed to start VM: %v", err)
	}

	if _, err := vm.Console.Expect(expect.All(
		// Enabling ACPI
		expect.String("[DEBUG]  SMI#: Enabling ACPI."),
		expect.String("Linux SMI handler starting"),
		expect.String("Enabling ACPI"),
		expect.String("[DEBUG]  Payload MM called core module at"),
		// Disabling ACPI
		expect.String("[DEBUG]  SMI#: Disabling ACPI."),
		expect.String("Linux SMI handler starting"),
		expect.String("Disabling ACPI"),
		expect.String("[DEBUG]  Payload MM called core module at"),
		// MM store
		expect.String("Linux SMI handler starting"),
		expect.String("[DEBUG]  Payload MM called core module at"),
		// Invalid SMI's
		expect.String("[DEBUG]  SMI#: Unknown APMC 0x00."),
		expect.String("[DEBUG]  SMI#: Unknown APMC 0x00."),
		// Entry point is calculated on the runtime and it is
		// dependent on bitness. Hence we just check whether start
		// of this "exception" occured
		expect.String("Payload MM already registered at"),
	)); err != nil {
		t.Error(err)
	}

	if err := vm.Kill(); err != nil {
		t.Error(err)
	}
}

func TestSharedSignatureFail(t *testing.T) {
	path, err := os.Getwd()

	if err != nil {
		t.Fatalf("working dir not found: %v", err)
	}

	vm, err := qemu.Start(
		qemu.ArchAMD64,
		qemu.WithQEMUCommand("qemu-system-x86_64 -bios "+path+"/images/coreboot_shared_signature.rom -M q35"),
		//qemu.LogSerialByLine(qemu.DefaultPrint("vm", t.Logf)),
		qemu.WithVMTimeout(20*time.Second),
	)

	if err != nil {
		t.Fatalf("Failed to start VM: %v", err)
	}

	if _, err := vm.Console.Expect(expect.All(
		// It is safe to assume that the signature read from the header will be 5a65a22c.
		// We "trigger" this fail by adding 0x1 to the address passed from the payload, and
		// consequently the header from which we read the signature is wrong.
		expect.String("MM signature mismatch! Bootloader: 65a22c82, Payload: 5a65a22c."),
		expect.String("mm_loader: register_entry_point: SMI returned 1"),
		expect.String("mm_loader: registering entry point for MM payload failed."),
		// any subsequent SMIs should never end up in the payload owned code in such case
		expect.String("[DEBUG]  SMI#: Enabling ACPI."),
		expect.String("[WARN ]  Payload MM not yet registered."),
		// Disabling ACPI
		expect.String("[DEBUG]  SMI#: Disabling ACPI."),
		expect.String("[WARN ]  Payload MM not yet registered."),
		// MM store
		expect.String("[WARN ]  Payload MM not yet registered."),
		expect.String("[DEBUG]  Unknown SMM store v1 command: 0x00"),
		// Invalid SMI's
		expect.String("[DEBUG]  SMI#: Unknown APMC 0x00."),
		expect.String("[DEBUG]  SMI#: Unknown APMC 0x00."),
	)); err != nil {
		t.Error(err)
	}

	if err := vm.Kill(); err != nil {
		t.Error(err)
	}
}

func TestSMRAMSignatureFail(t *testing.T) {
	path, err := os.Getwd()

	if err != nil {
		t.Fatalf("working dir not found: %v", err)
	}

	vm, err := qemu.Start(
		qemu.ArchAMD64,
		qemu.WithQEMUCommand("qemu-system-x86_64 -bios "+path+"/images/coreboot_smram_signature.rom -M q35"),
		//qemu.LogSerialByLine(qemu.DefaultPrint("vm", t.Logf)),
		qemu.WithVMTimeout(20*time.Second),
	)

	if err != nil {
		t.Fatalf("Failed to start VM: %v", err)
	}

	if _, err := vm.Console.Expect(expect.All(
		// This fail was "triggered" here by copying the handler to the different region
		// than the dedicated one (in which we expect the header with the signature to be).
		// Because of the, the actual signature will be empty.
		expect.String("MM signature mismatch! Bootloader: 65a22c82, Payload: 0."),
		expect.String("mm_loader: register_entry_point: SMI returned 1"),
		expect.String("mm_loader: registering entry point for MM payload failed."),
		// any subsequent SMIs should never end up in the payload owned code in such case
		expect.String("[DEBUG]  SMI#: Enabling ACPI."),
		expect.String("[WARN ]  Payload MM not yet registered."),
		// Disabling ACPI
		expect.String("[DEBUG]  SMI#: Disabling ACPI."),
		expect.String("[WARN ]  Payload MM not yet registered."),
		// MM store
		expect.String("[WARN ]  Payload MM not yet registered."),
		expect.String("[DEBUG]  Unknown SMM store v1 command: 0x00"),
		// Invalid SMI's
		expect.String("[DEBUG]  SMI#: Unknown APMC 0x00."),
		expect.String("[DEBUG]  SMI#: Unknown APMC 0x00."),
		expect.String("MM signature mismatch! Bootloader: 65a22c82, Payload: 0."),
	)); err != nil {
		t.Error(err)
	}

	if err := vm.Kill(); err != nil {
		t.Error(err)
	}
}
