#!/bin/bash




################################################################################
###        #####################################################################
### x86_32 #####################################################################
###        #####################################################################
################################################################################




echo "=== [ x86_32 ] ================================================================="

echo "--- [ add ] --------------------------------------------------------------------"

echo "~~~ [ dagger ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# - [FAILURE] lift failure
#
#    LLVM ERROR: Found stripped ELF file, could not find entrypoint.
#
#./lift-dagger.sh x86_32/add/add.o > x86_32/add/add.dagger.ll

# - [FAILURE] lift failure
#
#    error: no dc translator for target i386-unknown-unknown
#
#./lift-dagger.sh x86_32/add/main > x86_32/add/main.dagger.ll

echo "~~~ [ llvm-mctoll ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# - [FAIL] lift failure (no support for x86_32)
#
#    No support to raise Binaries other than x64 and ARM
#
#./lift-llvm-mctoll.sh x86_32/add/add.o

echo "--- [ hello ] ------------------------------------------------------------------"




################################################################################
###        #####################################################################
### x86_64 #####################################################################
###        #####################################################################
################################################################################




echo "=== [ x86_64 ] ================================================================="

echo "--- [ add ] --------------------------------------------------------------------"

echo "~~~ [ dagger ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret success (no main function to execute)
#
# - [SUCCESS] recompile success
#
# TODO: uncomment
#./lift-dagger.sh x86_64/add/add.o > x86_64/add/add.dagger.ll

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret success (return value 42)
#
# - [FAIL] recompile failure (not self contained)
#
#    undefined reference to `llvm.dc.translate.at'
#
# TODO: uncomment
#./lift-dagger.sh x86_64/add/main > x86_64/add/main.dagger.ll

echo "~~~ [ llvm-mctoll ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# - [FAIL] lift failure (no support for `*.o`)
#
#    Raising x64 relocatable (.o) x64 binaries not supported
#
#./lift-llvm-mctoll.sh x86_64/add/add.o

# - [FAIL] lift failure
#
#    llvm-mctoll: /home/u/Desktop/lifters/llvm-mctoll/llvm-project/llvm/tools/llvm-mctoll/X86/X86FuncPrototypeDiscovery.cpp:612: llvm::Type* X86MachineInstructionRaiser::getReturnTypeFromMBB(const llvm::MachineBasicBlock&, bool&): Assertion `(CalledFunc != nullptr) && "No called function prototype found while determining return type"' failed.
#     #0 0x0000555f02fcc43a llvm::sys::PrintStackTrace(llvm::raw_ostream&) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc4e43a)
#     #1 0x0000555f02fca4e4 llvm::sys::RunSignalHandlers() (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc4c4e4)
#     #2 0x0000555f02fca628 SignalHandler(int) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc4c628)
#     #3 0x00007f6deb46a960 __restore_rt (/usr/lib/libpthread.so.0+0x14960)
#     #4 0x00007f6deaef1355 raise (/usr/lib/libc.so.6+0x3c355)
#     #5 0x00007f6deaeda853 abort (/usr/lib/libc.so.6+0x25853)
#     #6 0x00007f6deaeda727 _nl_load_domain.cold (/usr/lib/libc.so.6+0x25727)
#     #7 0x00007f6deaee9936 (/usr/lib/libc.so.6+0x34936)
#     #8 0x0000555f02ff60bc X86MachineInstructionRaiser::getReturnTypeFromMBB(llvm::MachineBasicBlock const&, bool&) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc780bc)
#     #9 0x0000555f02ff6121 X86MachineInstructionRaiser::getReachingReturnType(llvm::MachineBasicBlock const&) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc78121)
#    #10 0x0000555f02ff75f5 X86MachineInstructionRaiser::getFunctionReturnType() (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc795f5)
#    #11 0x0000555f02ff85ac X86MachineInstructionRaiser::getRaisedFunctionPrototype() (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0xc7a5ac)
#    #12 0x0000555f0257e8ca ModuleRaiser::runMachineFunctionPasses() (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0x2008ca)
#    #13 0x0000555f02540be8 DisassembleObject(llvm::object::ObjectFile const*, bool) (.constprop.0) (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0x1c2be8)
#    #14 0x0000555f024fe68f main (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0x18068f)
#    #15 0x00007f6deaedc002 __libc_start_main (/usr/lib/libc.so.6+0x27002)
#    #16 0x0000555f0252dc6e _start (/home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll+0x1afc6e)
#    PLEASE submit a bug report to https://bugs.llvm.org/ and include the crash backtrace.
#    Stack dump:
#    0.	Program arguments: /home/u/Desktop/lifters/llvm-mctoll/llvm-project/build/bin/llvm-mctoll x86_64/add/main
#
#./lift-llvm-mctoll.sh x86_64/add/main

echo "--- [ hello ] ------------------------------------------------------------------"

echo "~~~ [ dagger ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# - [SUCCESS] lift successful
#
# - [FAIL] interpret failure
#
#    0.	Program arguments: lli x86_64/hello/main.dagger.ll
#     #0 0x00007f074e06677b llvm::sys::PrintStackTrace(llvm::raw_ostream&) (/usr/bin/../lib/libLLVM-10.so+0x9e377b)
#     #1 0x00007f074e0642d4 llvm::sys::RunSignalHandlers() (/usr/bin/../lib/libLLVM-10.so+0x9e12d4)
#     #2 0x00007f074e064429 (/usr/bin/../lib/libLLVM-10.so+0x9e1429)
#     #3 0x00007f074d675960 __restore_rt (/usr/bin/../lib/libpthread.so.0+0x14960)
#     #4 0x00007f0752aaa3fc
#     #5 0x00007f0752aaa23e
#     #6 0x00007f0752aaa483
#     #7 0x00007f074f9f7233 llvm::MCJIT::runFunction(llvm::Function*, llvm::ArrayRef<llvm::GenericValue>) (/usr/bin/../lib/libLLVM-10.so+0x2374233)
#     #8 0x00007f074f99cf05 llvm::ExecutionEngine::runFunctionAsMain(llvm::Function*, std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > > const&, char const* const*) (/usr/bin/../lib/libLLVM-10.so+0x2319f05)
#     #9 0x0000557a10c62dcd main (/usr/bin/lli+0x1ddcd)
#    #10 0x00007f074d2e4002 __libc_start_main (/usr/bin/../lib/libc.so.6+0x27002)
#    #11 0x0000557a10c6453e _start (/usr/bin/lli+0x1f53e)
#
# - [FAIL] recompile failure (not self contained)
#
#    undefined reference to `llvm.dc.translate.at'
#
# TODO: uncomment
#./lift-dagger.sh x86_64/hello/main > x86_64/hello/main.dagger.ll

echo "~~~ [ llvm-mctoll ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret successful (with minor update of main function signature)
#
#    LLVM ERROR: Invalid type for second argument of main() supplied
#
# - [SUCCESS] recompile sucessful
#
#./lift-llvm-mctoll.sh -o x86_64/hello/main.llvm-mctoll.ll x86_64/hello/main
