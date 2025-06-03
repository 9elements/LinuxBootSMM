savedcmd_.module-common.o := gcc -Wp,-MMD,./..module-common.o.d -nostdinc -I/home/micgor32/patches-prep/linux/arch/x86/include -I/home/micgor32/patches-prep/linux/arch/x86/include/generated -I/home/micgor32/patches-prep/linux/include -I/home/micgor32/patches-prep/linux/include -I/home/micgor32/patches-prep/linux/arch/x86/include/uapi -I/home/micgor32/patches-prep/linux/arch/x86/include/generated/uapi -I/home/micgor32/patches-prep/linux/include/uapi -I/home/micgor32/patches-prep/linux/include/generated/uapi -include /home/micgor32/patches-prep/linux/include/linux/compiler-version.h -include /home/micgor32/patches-prep/linux/include/linux/kconfig.h -include /home/micgor32/patches-prep/linux/include/linux/compiler_types.h -D__KERNEL__ -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=branch -fno-jump-tables -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -march=x86-64 -mtune=generic -mno-red-zone -mcmodel=kernel -mstack-protector-guard=global -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fno-jump-tables -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -Os -fno-allow-store-data-races -fstack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=zero -fno-stack-clash-protection -fmin-function-alignment=16 -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=1024 -Wno-main -Wno-dangling-pointer -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter  -DMODULE  -DKBUILD_BASENAME='".module_common"' -DKBUILD_MODNAME='".module_common.o"' -D__KBUILD_MODNAME=kmod_.module_common.o -c -o .module-common.o /home/micgor32/patches-prep/linux/scripts/module-common.c   ; /home/micgor32/patches-prep/linux/tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --static-call --uaccess --prefix=16  --link  --module .module-common.o

source_.module-common.o := /home/micgor32/patches-prep/linux/scripts/module-common.c

deps_.module-common.o := \
    $(wildcard include/config/UNWINDER_ORC) \
    $(wildcard include/config/MITIGATION_RETPOLINE) \
  /home/micgor32/patches-prep/linux/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /home/micgor32/patches-prep/linux/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /home/micgor32/patches-prep/linux/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/FUNCTION_ALIGNMENT) \
    $(wildcard include/config/CC_HAS_SANE_FUNCTION_ALIGNMENT) \
    $(wildcard include/config/X86_64) \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/LD_DEAD_CODE_DATA_ELIMINATION) \
    $(wildcard include/config/LTO_CLANG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_COUNTED_BY) \
    $(wildcard include/config/CC_HAS_MULTIDIMENSIONAL_NONSTRING) \
    $(wildcard include/config/UBSAN_INTEGER_WRAP) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /home/micgor32/patches-prep/linux/include/linux/compiler_attributes.h \
  /home/micgor32/patches-prep/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
    $(wildcard include/config/CC_HAS_TYPEOF_UNQUAL) \
  /home/micgor32/patches-prep/linux/include/linux/module.h \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/JUMP_LABEL) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/FTRACE_MCOUNT_RECORD) \
    $(wildcard include/config/KPROBES) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/MODULE_UNLOAD) \
    $(wildcard include/config/MITIGATION_ITS) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
  /home/micgor32/patches-prep/linux/include/linux/list.h \
    $(wildcard include/config/LIST_HARDENED) \
    $(wildcard include/config/DEBUG_LIST) \
  /home/micgor32/patches-prep/linux/include/linux/container_of.h \
  /home/micgor32/patches-prep/linux/include/linux/build_bug.h \
  /home/micgor32/patches-prep/linux/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
    $(wildcard include/config/CFI_CLANG) \
    $(wildcard include/config/64BIT) \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/asm/rwonce.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/rwonce.h \
  /home/micgor32/patches-prep/linux/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /home/micgor32/patches-prep/linux/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /home/micgor32/patches-prep/linux/include/uapi/linux/types.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/uapi/asm/types.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/types.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/int-ll64.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/int-ll64.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/bitsperlong.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/bitsperlong.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/bitsperlong.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/posix_types.h \
  /home/micgor32/patches-prep/linux/include/linux/stddef.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/stddef.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/X86_32) \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/posix_types_64.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/posix_types.h \
  /home/micgor32/patches-prep/linux/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /home/micgor32/patches-prep/linux/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /home/micgor32/patches-prep/linux/include/linux/const.h \
  /home/micgor32/patches-prep/linux/include/vdso/const.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/const.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/barrier.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/CALL_THUNKS) \
    $(wildcard include/config/MITIGATION_RETHUNK) \
  /home/micgor32/patches-prep/linux/include/linux/stringify.h \
  /home/micgor32/patches-prep/linux/include/linux/objtool.h \
    $(wildcard include/config/FRAME_POINTER) \
    $(wildcard include/config/NOINSTR_VALIDATION) \
    $(wildcard include/config/MITIGATION_UNRET_ENTRY) \
    $(wildcard include/config/MITIGATION_SRSO) \
  /home/micgor32/patches-prep/linux/include/linux/objtool_types.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/asm.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/extable_fixup_types.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/bug.h \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  /home/micgor32/patches-prep/linux/include/linux/instrumentation.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
  /home/micgor32/patches-prep/linux/include/linux/once_lite.h \
  /home/micgor32/patches-prep/linux/include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  /home/micgor32/patches-prep/linux/include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
  /home/micgor32/patches-prep/linux/include/linux/stdarg.h \
  /home/micgor32/patches-prep/linux/include/linux/init.h \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
  /home/micgor32/patches-prep/linux/include/linux/kern_levels.h \
  /home/micgor32/patches-prep/linux/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /home/micgor32/patches-prep/linux/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/GENDWARFKSYMS) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/CALL_PADDING) \
    $(wildcard include/config/MITIGATION_SLS) \
    $(wildcard include/config/FUNCTION_PADDING_BYTES) \
    $(wildcard include/config/UML) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/ibt.h \
    $(wildcard include/config/X86_KERNEL_IBT) \
    $(wildcard include/config/FINEIBT_BHI) \
  /home/micgor32/patches-prep/linux/include/linux/ratelimit_types.h \
  /home/micgor32/patches-prep/linux/include/linux/bits.h \
  /home/micgor32/patches-prep/linux/include/vdso/bits.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/bits.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/param.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/uapi/asm/param.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/param.h \
  /home/micgor32/patches-prep/linux/include/linux/spinlock_types_raw.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  /home/micgor32/patches-prep/linux/include/linux/spinlock_types_up.h \
  /home/micgor32/patches-prep/linux/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/nops.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/barrier.h \
  /home/micgor32/patches-prep/linux/include/linux/stat.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/stat.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/stat.h \
  /home/micgor32/patches-prep/linux/include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  /home/micgor32/patches-prep/linux/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /home/micgor32/patches-prep/linux/include/uapi/linux/kernel.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/sysinfo.h \
  /home/micgor32/patches-prep/linux/include/vdso/cache.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/cache.h \
    $(wildcard include/config/X86_L1_CACHE_SHIFT) \
    $(wildcard include/config/X86_INTERNODE_CACHE_SHIFT) \
    $(wildcard include/config/X86_VSMP) \
  /home/micgor32/patches-prep/linux/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /home/micgor32/patches-prep/linux/include/linux/math.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/div64.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/div64.h \
    $(wildcard include/config/CC_OPTIMIZE_FOR_PERFORMANCE) \
  /home/micgor32/patches-prep/linux/include/vdso/math64.h \
  /home/micgor32/patches-prep/linux/include/linux/time64.h \
  /home/micgor32/patches-prep/linux/include/vdso/time64.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/time.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/time_types.h \
  /home/micgor32/patches-prep/linux/include/linux/time32.h \
  /home/micgor32/patches-prep/linux/include/linux/timex.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/timex.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/timex.h \
    $(wildcard include/config/X86_TSC) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/processor.h \
    $(wildcard include/config/X86_VMX_FEATURE_NAMES) \
    $(wildcard include/config/X86_IOPL_IOPERM) \
    $(wildcard include/config/VM86) \
    $(wildcard include/config/X86_USER_SHADOW_STACK) \
    $(wildcard include/config/USE_X86_SEG_SUPPORT) \
    $(wildcard include/config/PARAVIRT_XXL) \
    $(wildcard include/config/CPU_SUP_AMD) \
    $(wildcard include/config/XEN) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/MITIGATION_PAGE_TABLE_ISOLATION) \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/processor-flags.h \
  /home/micgor32/patches-prep/linux/include/linux/mem_encrypt.h \
    $(wildcard include/config/ARCH_HAS_MEM_ENCRYPT) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/mem_encrypt.h \
    $(wildcard include/config/X86_MEM_ENCRYPT) \
  /home/micgor32/patches-prep/linux/include/linux/cc_platform.h \
    $(wildcard include/config/ARCH_HAS_CC_PLATFORM) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/math_emu.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/ptrace.h \
    $(wildcard include/config/PARAVIRT) \
    $(wildcard include/config/IA32_EMULATION) \
    $(wildcard include/config/X86_DEBUGCTLMSR) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/segment.h \
    $(wildcard include/config/XEN_PV) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/page_types.h \
    $(wildcard include/config/PHYSICAL_START) \
    $(wildcard include/config/PHYSICAL_ALIGN) \
    $(wildcard include/config/DYNAMIC_PHYSICAL_MASK) \
  /home/micgor32/patches-prep/linux/include/vdso/page.h \
    $(wildcard include/config/PAGE_SHIFT) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/KASAN) \
    $(wildcard include/config/DYNAMIC_MEMORY_LAYOUT) \
    $(wildcard include/config/X86_5LEVEL) \
    $(wildcard include/config/RANDOMIZE_BASE) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/kaslr.h \
    $(wildcard include/config/RANDOMIZE_MEMORY) \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/ptrace.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/ptrace-abi.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/proto.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/ldt.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/sigcontext.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/current.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/CC_HAS_NAMED_AS) \
  /home/micgor32/patches-prep/linux/include/linux/args.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/percpu.h \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /home/micgor32/patches-prep/linux/include/linux/threads.h \
    $(wildcard include/config/NR_CPUS) \
    $(wildcard include/config/BASE_SMALL) \
  /home/micgor32/patches-prep/linux/include/linux/percpu-defs.h \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/cpufeatures.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/cpuid.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/cpuid/api.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/cpuid/types.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/string.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/string_64.h \
    $(wildcard include/config/KMSAN) \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
  /home/micgor32/patches-prep/linux/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /home/micgor32/patches-prep/linux/include/linux/cleanup.h \
  /home/micgor32/patches-prep/linux/include/linux/atomic.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/atomic.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/cmpxchg.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/cmpxchg_64.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/rmwcc.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/atomic64_64.h \
  /home/micgor32/patches-prep/linux/include/linux/atomic/atomic-arch-fallback.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  /home/micgor32/patches-prep/linux/include/linux/atomic/atomic-long.h \
  /home/micgor32/patches-prep/linux/include/linux/atomic/atomic-instrumented.h \
  /home/micgor32/patches-prep/linux/include/linux/instrumented.h \
  /home/micgor32/patches-prep/linux/include/linux/kmsan-checks.h \
  /home/micgor32/patches-prep/linux/include/linux/bug.h \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/page.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/page_64.h \
    $(wildcard include/config/DEBUG_VIRTUAL) \
    $(wildcard include/config/X86_VSYSCALL_EMULATION) \
  /home/micgor32/patches-prep/linux/include/linux/range.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/FLATMEM) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
    $(wildcard include/config/SPARSEMEM) \
  /home/micgor32/patches-prep/linux/include/linux/pfn.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/getorder.h \
  /home/micgor32/patches-prep/linux/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /home/micgor32/patches-prep/linux/include/linux/bitops.h \
  /home/micgor32/patches-prep/linux/include/linux/typecheck.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/bitops/generic-non-atomic.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/X86_CMOV) \
  /home/micgor32/patches-prep/linux/include/asm-generic/bitops/sched.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/arch_hweight.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/bitops/const_hweight.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/bitops/instrumented-atomic.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/bitops/instrumented-non-atomic.h \
    $(wildcard include/config/KCSAN_ASSUME_PLAIN_WRITES_ATOMIC) \
  /home/micgor32/patches-prep/linux/include/asm-generic/bitops/instrumented-lock.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/bitops/le.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/byteorder.h \
  /home/micgor32/patches-prep/linux/include/linux/byteorder/little_endian.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/byteorder/little_endian.h \
  /home/micgor32/patches-prep/linux/include/linux/swab.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/swab.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/swab.h \
  /home/micgor32/patches-prep/linux/include/linux/byteorder/generic.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/X86_INTEL_MEMORY_PROTECTION_KEYS) \
    $(wildcard include/config/X86_PAE) \
    $(wildcard include/config/MEM_SOFT_DIRTY) \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_WP) \
    $(wildcard include/config/PGTABLE_LEVELS) \
    $(wildcard include/config/PROC_FS) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/pgtable_64_types.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL_FORCE_MAP) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/sparsemem.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/desc_defs.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/special_insns.h \
  /home/micgor32/patches-prep/linux/include/linux/errno.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/errno.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/uapi/asm/errno.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/errno.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/errno-base.h \
  /home/micgor32/patches-prep/linux/include/linux/irqflags.h \
    $(wildcard include/config/PROVE_LOCKING) \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /home/micgor32/patches-prep/linux/include/linux/irqflags_types.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/irqflags.h \
    $(wildcard include/config/DEBUG_ENTRY) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/nospec-branch.h \
    $(wildcard include/config/CALL_THUNKS_DEBUG) \
    $(wildcard include/config/MITIGATION_CALL_DEPTH_TRACKING) \
    $(wildcard include/config/MITIGATION_IBPB_ENTRY) \
  /home/micgor32/patches-prep/linux/include/linux/static_key.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/msr-index.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/unwind_hints.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/orc_types.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/asm-offsets.h \
  /home/micgor32/patches-prep/linux/include/generated/asm-offsets.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/GEN-for-each-reg.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/fpu/types.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/vmxfeatures.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/vdso/processor.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/shstk.h \
  /home/micgor32/patches-prep/linux/include/linux/personality.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/personality.h \
  /home/micgor32/patches-prep/linux/include/linux/err.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/tsc.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/cpufeature.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/asm/cpufeaturemasks.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/msr.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/cpumask.h \
  /home/micgor32/patches-prep/linux/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  /home/micgor32/patches-prep/linux/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/MMU) \
  /home/micgor32/patches-prep/linux/include/linux/align.h \
  /home/micgor32/patches-prep/linux/include/vdso/align.h \
  /home/micgor32/patches-prep/linux/include/linux/array_size.h \
  /home/micgor32/patches-prep/linux/include/linux/limits.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/limits.h \
  /home/micgor32/patches-prep/linux/include/vdso/limits.h \
  /home/micgor32/patches-prep/linux/include/linux/hex.h \
  /home/micgor32/patches-prep/linux/include/linux/kstrtox.h \
  /home/micgor32/patches-prep/linux/include/linux/minmax.h \
  /home/micgor32/patches-prep/linux/include/linux/sprintf.h \
  /home/micgor32/patches-prep/linux/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
  /home/micgor32/patches-prep/linux/include/linux/instruction_pointer.h \
  /home/micgor32/patches-prep/linux/include/linux/wordpart.h \
  /home/micgor32/patches-prep/linux/include/linux/bitmap.h \
  /home/micgor32/patches-prep/linux/include/linux/find.h \
  /home/micgor32/patches-prep/linux/include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  /home/micgor32/patches-prep/linux/include/linux/overflow.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/string.h \
  /home/micgor32/patches-prep/linux/include/linux/fortify-string.h \
    $(wildcard include/config/CC_HAS_KASAN_MEMINTRINSIC_PREFIX) \
    $(wildcard include/config/GENERIC_ENTRY) \
  /home/micgor32/patches-prep/linux/include/linux/bitfield.h \
  /home/micgor32/patches-prep/linux/include/linux/bitmap-str.h \
  /home/micgor32/patches-prep/linux/include/linux/cpumask_types.h \
  /home/micgor32/patches-prep/linux/include/linux/gfp_types.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
    $(wildcard include/config/SLAB_OBJ_EXT) \
  /home/micgor32/patches-prep/linux/include/linux/numa.h \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /home/micgor32/patches-prep/linux/include/linux/nodemask.h \
    $(wildcard include/config/HIGHMEM) \
  /home/micgor32/patches-prep/linux/include/linux/nodemask_types.h \
    $(wildcard include/config/NODES_SHIFT) \
  /home/micgor32/patches-prep/linux/include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  /home/micgor32/patches-prep/linux/include/uapi/linux/random.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/ioctl.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/uapi/asm/ioctl.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/ioctl.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/ioctl.h \
  /home/micgor32/patches-prep/linux/include/linux/irqnr.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/irqnr.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/msr.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/shared/msr.h \
  /home/micgor32/patches-prep/linux/include/linux/percpu.h \
    $(wildcard include/config/MEM_ALLOC_PROFILING) \
    $(wildcard include/config/RANDOM_KMALLOC_CACHES) \
    $(wildcard include/config/PAGE_SIZE_4KB) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
  /home/micgor32/patches-prep/linux/include/linux/alloc_tag.h \
    $(wildcard include/config/MEM_ALLOC_PROFILING_DEBUG) \
    $(wildcard include/config/MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT) \
  /home/micgor32/patches-prep/linux/include/linux/codetag.h \
    $(wildcard include/config/CODE_TAGGING) \
  /home/micgor32/patches-prep/linux/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPTION) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/PREEMPT) \
    $(wildcard include/config/PREEMPT_LAZY) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/preempt.h \
  /home/micgor32/patches-prep/linux/include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
    $(wildcard include/config/CSD_LOCK_WAIT_DEBUG) \
  /home/micgor32/patches-prep/linux/include/linux/smp_types.h \
  /home/micgor32/patches-prep/linux/include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  /home/micgor32/patches-prep/linux/include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  /home/micgor32/patches-prep/linux/include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/SCHED_CLASS_EXT) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/MEMCG_V1) \
    $(wildcard include/config/LRU_GEN) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/ARCH_HAS_CPU_PASID) \
    $(wildcard include/config/X86_BUS_LOCK_DETECT) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/SYSVIPC) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/DEBUG_MUTEXES) \
    $(wildcard include/config/DETECT_HUNG_TASK_BLOCKER) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/COMPAT) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/RSEQ) \
    $(wildcard include/config/DEBUG_RSEQ) \
    $(wildcard include/config/SCHED_MM_CID) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/UPROBES) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/VMAP_STACK) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/GCC_PLUGIN_STACKLEAK) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/USER_EVENTS) \
  /home/micgor32/patches-prep/linux/include/uapi/linux/sched.h \
  /home/micgor32/patches-prep/linux/include/linux/thread_info.h \
    $(wildcard include/config/ARCH_HAS_PREEMPT_LAZY) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/SH) \
  /home/micgor32/patches-prep/linux/include/linux/restart_block.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/X86_FRED) \
  /home/micgor32/patches-prep/linux/include/linux/pid_types.h \
  /home/micgor32/patches-prep/linux/include/linux/sem_types.h \
  /home/micgor32/patches-prep/linux/include/linux/shm.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/shmparam.h \
  /home/micgor32/patches-prep/linux/include/linux/kmsan_types.h \
  /home/micgor32/patches-prep/linux/include/linux/mutex_types.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
  /home/micgor32/patches-prep/linux/include/linux/osq_lock.h \
  /home/micgor32/patches-prep/linux/include/linux/spinlock_types.h \
  /home/micgor32/patches-prep/linux/include/linux/rwlock_types.h \
  /home/micgor32/patches-prep/linux/include/linux/plist_types.h \
  /home/micgor32/patches-prep/linux/include/linux/hrtimer_types.h \
  /home/micgor32/patches-prep/linux/include/linux/timerqueue_types.h \
  /home/micgor32/patches-prep/linux/include/linux/rbtree_types.h \
  /home/micgor32/patches-prep/linux/include/linux/timer_types.h \
  /home/micgor32/patches-prep/linux/include/linux/seccomp_types.h \
    $(wildcard include/config/SECCOMP) \
  /home/micgor32/patches-prep/linux/include/linux/refcount_types.h \
  /home/micgor32/patches-prep/linux/include/linux/resource.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/resource.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/uapi/asm/resource.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/resource.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/resource.h \
  /home/micgor32/patches-prep/linux/include/linux/latencytop.h \
  /home/micgor32/patches-prep/linux/include/linux/sched/prio.h \
  /home/micgor32/patches-prep/linux/include/linux/sched/types.h \
  /home/micgor32/patches-prep/linux/include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  /home/micgor32/patches-prep/linux/include/uapi/linux/signal.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/signal.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/signal.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/signal-defs.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/siginfo.h \
  /home/micgor32/patches-prep/linux/include/uapi/asm-generic/siginfo.h \
  /home/micgor32/patches-prep/linux/include/linux/syscall_user_dispatch_types.h \
  /home/micgor32/patches-prep/linux/include/linux/mm_types_task.h \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/tlbbatch.h \
  /home/micgor32/patches-prep/linux/include/linux/netdevice_xmit.h \
    $(wildcard include/config/NET_EGRESS) \
  /home/micgor32/patches-prep/linux/include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  /home/micgor32/patches-prep/linux/include/linux/posix-timers_types.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/rseq.h \
  /home/micgor32/patches-prep/linux/include/linux/seqlock_types.h \
  /home/micgor32/patches-prep/linux/include/linux/kcsan.h \
  /home/micgor32/patches-prep/linux/include/linux/rv.h \
    $(wildcard include/config/RV_REACTORS) \
  /home/micgor32/patches-prep/linux/include/linux/livepatch_sched.h \
  /home/micgor32/patches-prep/linux/include/linux/uidgid_types.h \
  /home/micgor32/patches-prep/linux/include/linux/tracepoint-defs.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/asm/kmap_size.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  /home/micgor32/patches-prep/linux/include/linux/sched/ext.h \
    $(wildcard include/config/EXT_GROUP_SCHED) \
  /home/micgor32/patches-prep/linux/include/linux/spinlock.h \
  /home/micgor32/patches-prep/linux/include/linux/bottom_half.h \
  /home/micgor32/patches-prep/linux/include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/asm/mmiowb.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  /home/micgor32/patches-prep/linux/include/linux/spinlock_up.h \
  /home/micgor32/patches-prep/linux/include/linux/rwlock.h \
  /home/micgor32/patches-prep/linux/include/linux/spinlock_api_up.h \
  /home/micgor32/patches-prep/linux/include/vdso/time32.h \
  /home/micgor32/patches-prep/linux/include/vdso/time.h \
  /home/micgor32/patches-prep/linux/include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  /home/micgor32/patches-prep/linux/include/linux/highuid.h \
  /home/micgor32/patches-prep/linux/include/linux/buildid.h \
    $(wildcard include/config/VMCORE_INFO) \
  /home/micgor32/patches-prep/linux/include/linux/kmod.h \
  /home/micgor32/patches-prep/linux/include/linux/umh.h \
  /home/micgor32/patches-prep/linux/include/linux/gfp.h \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/CONTIG_ALLOC) \
  /home/micgor32/patches-prep/linux/include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/CMA) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/UNACCEPTED_MEMORY) \
    $(wildcard include/config/IOMMU_SUPPORT) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/LRU_GEN_WALKS_MMU) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP_PREINIT) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  /home/micgor32/patches-prep/linux/include/linux/list_nulls.h \
  /home/micgor32/patches-prep/linux/include/linux/wait.h \
  /home/micgor32/patches-prep/linux/include/linux/seqlock.h \
  /home/micgor32/patches-prep/linux/include/linux/mutex.h \
  /home/micgor32/patches-prep/linux/include/linux/debug_locks.h \
  /home/micgor32/patches-prep/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  /home/micgor32/patches-prep/linux/include/linux/page-flags-layout.h \
  /home/micgor32/patches-prep/linux/include/generated/bounds.h \
  /home/micgor32/patches-prep/linux/include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/HUGETLB_PMD_PAGE_TABLE_SHARING) \
    $(wildcard include/config/SLAB_FREELIST_HARDENED) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/ANON_VMA_NAME) \
    $(wildcard include/config/PER_VMA_LOCK) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/SPLIT_PMD_PTLOCKS) \
    $(wildcard include/config/IOMMU_MM_DATA) \
    $(wildcard include/config/KSM) \
    $(wildcard include/config/MM_ID) \
    $(wildcard include/config/CORE_DUMP_DEFAULT_ELF_HEADERS) \
  /home/micgor32/patches-prep/linux/include/linux/auxvec.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/auxvec.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/uapi/asm/auxvec.h \
  /home/micgor32/patches-prep/linux/include/linux/kref.h \
  /home/micgor32/patches-prep/linux/include/linux/refcount.h \
  /home/micgor32/patches-prep/linux/include/linux/rbtree.h \
  /home/micgor32/patches-prep/linux/include/linux/rcupdate.h \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/RCU_LAZY) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/KVM_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /home/micgor32/patches-prep/linux/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /home/micgor32/patches-prep/linux/include/linux/rcutree.h \
  /home/micgor32/patches-prep/linux/include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  /home/micgor32/patches-prep/linux/include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  /home/micgor32/patches-prep/linux/include/linux/completion.h \
  /home/micgor32/patches-prep/linux/include/linux/swait.h \
  /home/micgor32/patches-prep/linux/include/linux/uprobes.h \
  /home/micgor32/patches-prep/linux/include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
  /home/micgor32/patches-prep/linux/include/linux/ktime.h \
  /home/micgor32/patches-prep/linux/include/linux/jiffies.h \
  /home/micgor32/patches-prep/linux/include/vdso/jiffies.h \
  /home/micgor32/patches-prep/linux/include/generated/timeconst.h \
  /home/micgor32/patches-prep/linux/include/vdso/ktime.h \
  /home/micgor32/patches-prep/linux/include/linux/timekeeping.h \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  /home/micgor32/patches-prep/linux/include/linux/clocksource_ids.h \
  /home/micgor32/patches-prep/linux/include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  /home/micgor32/patches-prep/linux/include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  /home/micgor32/patches-prep/linux/include/linux/workqueue_types.h \
  /home/micgor32/patches-prep/linux/include/linux/percpu_counter.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/mmu.h \
    $(wildcard include/config/MODIFY_LDT_SYSCALL) \
    $(wildcard include/config/ADDRESS_MASKING) \
    $(wildcard include/config/BROADCAST_TLB_FLUSH) \
  /home/micgor32/patches-prep/linux/include/linux/page-flags.h \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_2) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_3) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
  /home/micgor32/patches-prep/linux/include/linux/local_lock.h \
  /home/micgor32/patches-prep/linux/include/linux/local_lock_internal.h \
  /home/micgor32/patches-prep/linux/include/linux/zswap.h \
    $(wildcard include/config/ZSWAP) \
  /home/micgor32/patches-prep/linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  /home/micgor32/patches-prep/linux/include/linux/notifier.h \
  /home/micgor32/patches-prep/linux/include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/NEED_SRCU_NMI_SAFE) \
  /home/micgor32/patches-prep/linux/include/linux/rcu_segcblist.h \
  /home/micgor32/patches-prep/linux/include/linux/srcutree.h \
  /home/micgor32/patches-prep/linux/include/linux/rcu_node_tree.h \
    $(wildcard include/config/RCU_FANOUT) \
    $(wildcard include/config/RCU_FANOUT_LEAF) \
  /home/micgor32/patches-prep/linux/include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  /home/micgor32/patches-prep/linux/include/linux/arch_topology.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/topology.h \
    $(wildcard include/config/X86_LOCAL_APIC) \
    $(wildcard include/config/SCHED_MC_PRIO) \
  /home/micgor32/patches-prep/linux/include/asm-generic/topology.h \
  /home/micgor32/patches-prep/linux/include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  /home/micgor32/patches-prep/linux/include/uapi/linux/sysctl.h \
  /home/micgor32/patches-prep/linux/include/linux/elf.h \
    $(wildcard include/config/ARCH_HAVE_EXTRA_ELF_NOTES) \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/elf.h \
    $(wildcard include/config/X86_X32_ABI) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/ia32.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/user.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/user_64.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/fsgsbase.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/vdso.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/elf.h \
  /home/micgor32/patches-prep/linux/include/uapi/linux/elf-em.h \
  /home/micgor32/patches-prep/linux/include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  /home/micgor32/patches-prep/linux/include/linux/sysfs.h \
  /home/micgor32/patches-prep/linux/include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  /home/micgor32/patches-prep/linux/include/linux/idr.h \
  /home/micgor32/patches-prep/linux/include/linux/radix-tree.h \
  /home/micgor32/patches-prep/linux/include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  /home/micgor32/patches-prep/linux/include/linux/sched/mm.h \
    $(wildcard include/config/MMU_LAZY_TLB_REFCOUNT) \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
  /home/micgor32/patches-prep/linux/include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_PREPARE_SYNC_CORE_CMD) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/sync_core.h \
  /home/micgor32/patches-prep/linux/include/linux/sched/coredump.h \
  /home/micgor32/patches-prep/linux/include/linux/kobject_ns.h \
  /home/micgor32/patches-prep/linux/include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/PPC64) \
  /home/micgor32/patches-prep/linux/include/linux/rbtree_latch.h \
  /home/micgor32/patches-prep/linux/include/linux/error-injection.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/error-injection.h \
  /home/micgor32/patches-prep/linux/include/linux/dynamic_debug.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/module.h \
  /home/micgor32/patches-prep/linux/include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \
  /home/micgor32/patches-prep/linux/include/linux/build-salt.h \
    $(wildcard include/config/BUILD_SALT) \
  /home/micgor32/patches-prep/linux/include/linux/elfnote.h \
  /home/micgor32/patches-prep/linux/include/linux/elfnote-lto.h \
    $(wildcard include/config/LTO) \
  /home/micgor32/patches-prep/linux/include/linux/vermagic.h \
    $(wildcard include/config/PREEMPT_BUILD) \
  /home/micgor32/patches-prep/linux/include/generated/utsrelease.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/vermagic.h \
    $(wildcard include/config/M486SX) \
    $(wildcard include/config/M486) \
    $(wildcard include/config/M586) \
    $(wildcard include/config/M586TSC) \
    $(wildcard include/config/M586MMX) \
    $(wildcard include/config/MATOM) \
    $(wildcard include/config/M686) \
    $(wildcard include/config/MPENTIUMII) \
    $(wildcard include/config/MPENTIUMIII) \
    $(wildcard include/config/MPENTIUMM) \
    $(wildcard include/config/MPENTIUM4) \
    $(wildcard include/config/MK6) \
    $(wildcard include/config/MK7) \
    $(wildcard include/config/MELAN) \
    $(wildcard include/config/MCRUSOE) \
    $(wildcard include/config/MEFFICEON) \
    $(wildcard include/config/MWINCHIPC6) \
    $(wildcard include/config/MWINCHIP3D) \
    $(wildcard include/config/MCYRIXIII) \
    $(wildcard include/config/MVIAC3_2) \
    $(wildcard include/config/MVIAC7) \
    $(wildcard include/config/MGEODEGX1) \
    $(wildcard include/config/MGEODE_LX) \
  /home/micgor32/patches-prep/linux/arch/x86/include/asm/orc_header.h \
  /home/micgor32/patches-prep/linux/arch/x86/include/generated/asm/orc_hash.h \

.module-common.o: $(deps_.module-common.o)

$(deps_.module-common.o):

.module-common.o: $(wildcard /home/micgor32/patches-prep/linux/tools/objtool/objtool)
