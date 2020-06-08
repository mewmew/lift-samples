#!/bin/bash

# llvm-mctoll

echo "=== [ x86_32 ] ================================================================="

echo "--- [ add ] --------------------------------------------------------------------"

echo "~~~ [ llvm-mctoll ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# No support for x86 (32-bit).
#    No support to raise Binaries other than x64 and ARM
#./lift-llvm-mctoll.sh x86_32/add/add.o

echo "=== [ x86_64 ] ================================================================="

echo "--- [ add ] --------------------------------------------------------------------"

echo "~~~ [ llvm-mctoll ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# No support for `*.o`
#    Raising x64 relocatable (.o) x64 binaries not supported
#./lift-llvm-mctoll.sh x86_64/add/add.o

# Crash.
#   llvm-mctoll: /home/u/Desktop/lifters/llvm-mctoll/llvm-project/llvm/tools/llvm-mctoll/X86/X86FuncPrototypeDiscovery.cpp:612: llvm::Type* X86MachineInstructionRaiser::getReturnTypeFromMBB(const llvm::MachineBasicBlock&, bool&): Assertion `(CalledFunc != nullptr) && "No called function prototype found while determining return type"' failed.
#    #0 0x0000555f02fcc43a llvm::sys::PrintStackTrace(llvm::raw_ostream&) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc4e43a)
#    #1 0x0000555f02fca4e4 llvm::sys::RunSignalHandlers() (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc4c4e4)
#    #2 0x0000555f02fca628 SignalHandler(int) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc4c628)
#    #3 0x00007f6deb46a960 __restore_rt (/usr/lib/libpthread.so.0+0x14960)
#    #4 0x00007f6deaef1355 raise (/usr/lib/libc.so.6+0x3c355)
#    #5 0x00007f6deaeda853 abort (/usr/lib/libc.so.6+0x25853)
#    #6 0x00007f6deaeda727 _nl_load_domain.cold (/usr/lib/libc.so.6+0x25727)
#    #7 0x00007f6deaee9936 (/usr/lib/libc.so.6+0x34936)
#    #8 0x0000555f02ff60bc X86MachineInstructionRaiser::getReturnTypeFromMBB(llvm::MachineBasicBlock const&, bool&) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc780bc)
#    #9 0x0000555f02ff6121 X86MachineInstructionRaiser::getReachingReturnType(llvm::MachineBasicBlock const&) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc78121)
#   #10 0x0000555f02ff75f5 X86MachineInstructionRaiser::getFunctionReturnType() (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc795f5)
#   #11 0x0000555f02ff85ac X86MachineInstructionRaiser::getRaisedFunctionPrototype() (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc7a5ac)
#   #12 0x0000555f0257e8ca ModuleRaiser::runMachineFunctionPasses() (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0x2008ca)
#   #13 0x0000555f02540be8 DisassembleObject(llvm::object::ObjectFile const*, bool) (.constprop.0) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0x1c2be8)
#   #14 0x0000555f024fe68f main (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0x18068f)
#   #15 0x00007f6deaedc002 __libc_start_main (/usr/lib/libc.so.6+0x27002)
#   #16 0x0000555f0252dc6e _start (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0x1afc6e)
#   PLEASE submit a bug report to https://bugs.llvm.org/ and include the crash backtrace.
#   Stack dump:
#   0.	Program arguments: /home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll x86_64/add/main
#./lift-llvm-mctoll.sh x86_64/add/main

echo "--- [ hello ] ------------------------------------------------------------------"

echo "~~~ [ llvm-mctoll ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# - [SUCCESS] lift successful
# - [FAIL] interpret failure
#    LLVM ERROR: Invalid type for second argument of main() supplied
./lift-llvm-mctoll.sh x86_64/hello/main
