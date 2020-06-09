#!/bin/bash

# --- [ Dagger ] ---------------------------------------------------------------
#
# * x86_64

# --- [ Ghidra-to-LLVM ] -------------------------------------------------------
#
# * Ghidra P-code

# --- [ llvm-mctoll ] ----------------------------------------------------------
#
# * x86_64

# --- [ reopt ] ----------------------------------------------------------------
#
# * x86_64

# --- [ RetDec ] ---------------------------------------------------------------
#
# * x86_32
# * ARM_32
# * MIPS_32
# * PIC32
# * PowerPC_32
#
# * x86_64

# --- [ rev.ng ] ---------------------------------------------------------------
#
# * ARM
# * MIPS
#
# * x86_64



################################################################################
###        #####################################################################
### x86_32 #####################################################################
###        #####################################################################
################################################################################




echo -e "=== [ x86_32 ] =================================================================\n"

# Lifters missing support for x86_32:
#
#    * Dagger
#    * llvm-mctoll
#    * reopt

echo -e "--- [ add ] --------------------------------------------------------------------\n"

echo -e "~~~ [ retdec ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret success (no main function to execute)
#
# - [FAIL] recompile failure
#
#    undefined reference to `__decompiler_undefined_function_0'
#
echo -e "Lifting x86_32/add/add.o\n"
./lift-retdec.sh -k -o x86_32/add/add.o.retdec.c x86_32/add/add.o >/dev/null
rm -f x86_32/add/*.retdec.{bc,config.json,dsm}

# - [SUCCESS] lift successful
#
# - [FAIL] interpret failure
#
#    LLVM ERROR: Cannot select: 0x558e3e8cfb30: ch,glue = X86ISD::CALL 0x558e3e8cfa60, 0x558e3e8cf788, RegisterMask:Untyped
#      0x558e3e8cf788: i32 = X86ISD::Wrapper TargetGlobalAddress:i32<i32 ()* @__decompiler_undefined_function_0> 0
#        0x558e3e8cf720: i32 = TargetGlobalAddress<i32 ()* @__decompiler_undefined_function_0> 0
#      0x558e3e8cfac8: Untyped = RegisterMask
#    In function: _init
#
# - [FAIL] recompile failure
#
#    undefined reference to `__decompiler_undefined_function_0'
#
echo -e "Lifting x86_32/add/main\n"
./lift-retdec.sh -k -o x86_32/add/main.retdec.c x86_32/add/main >/dev/null
rm -f x86_32/add/*.retdec.{bc,config.json,dsm}

echo -e "~~~ [ rev.ng ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret successful (no main function in lifted IR)
#
# - [FAIL] recompile failure (not self contained)
#
#    undefined reference to `cpu_x86_signal_handler'
#
echo -e "Lifting x86_32/add/add.o\n"
./lift-revng.sh x86_32/add/add.o x86_32/add/add.o.revng.ll
rm -f x86_32/add/*.revng.*.csv

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret successful (no main function in lifted IR)
#
# - [FAIL] recompile failure (not self contained)
#
#    undefined reference to `cpu_x86_signal_handler'
#
echo -e "Lifting x86_32/add/main\n"
./lift-revng.sh x86_32/add/main x86_32/add/main.revng.ll
rm -f x86_32/add/*.revng.*.csv

echo -e "--- [ hello ] ------------------------------------------------------------------\n"

echo -e "~~~ [ retdec ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [FAIL] interpret failure
#
#    LLVM ERROR: Cannot select: 0x56131b318a90: ch,glue = X86ISD::CALL 0x56131b3189c0, 0x56131b3186e8, RegisterMask:Untyped
#      0x56131b3186e8: i32 = X86ISD::Wrapper TargetGlobalAddress:i32<i32 ()* @__decompiler_undefined_function_0> 0
#        0x56131b318680: i32 = TargetGlobalAddress<i32 ()* @__decompiler_undefined_function_0> 0
#      0x56131b318a28: Untyped = RegisterMask
#    In function: _init
#
# - [FAIL] recompile failure
#
#    undefined reference to `__decompiler_undefined_function_0'
#
echo -e "Lifting x86_32/hello/main\n"
./lift-retdec.sh -k -o x86_32/hello/main.retdec.c x86_32/hello/main >/dev/null
rm -f x86_32/hello/*.retdec.{bc,config.json,dsm}

echo -e "~~~ [ rev.ng ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret successful (no main function in lifted IR)
#
# - [FAIL] recompile failure (not self contained)
#
#    <inline asm>:1:12: error: instruction requires: 64-bit mode
#            cld; rep; stosq
#
echo -e "Lifting x86_32/hello/main\n"
./lift-revng.sh x86_32/hello/main x86_32/hello/main.revng.ll
rm -f x86_32/hello/*.revng.*.csv



################################################################################
###        #####################################################################
### x86_64 #####################################################################
###        #####################################################################
################################################################################




echo -e "=== [ x86_64 ] =================================================================\n"

echo -e "--- [ add ] --------------------------------------------------------------------\n"

echo -e "~~~ [ dagger ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret success (no main function to execute)
#
# - [SUCCESS] recompile success
#
echo -e "Lifting x86_64/add/add.o\n"
./lift-dagger.sh x86_64/add/add.o > x86_64/add/add.o.dagger.ll

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret success (return value 42)
#
# - [FAIL] recompile failure (not self contained)
#
#    undefined reference to `llvm.dc.translate.at'
#
echo -e "Lifting x86_64/add/main\n"
./lift-dagger.sh x86_64/add/main > x86_64/add/main.dagger.ll

echo -e "~~~ [ Ghidra-to-LLVM ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret successful (correct execution when adding custom @main function invoking @add)
#
# - [SUCCESS] recompile successful
#
echo -e "Lifting x86_64/add/add.o\n"
./lift-ghidra-to-llvm.sh -o x86_64/add/add.o.ghidra-to-llvm.ll x86_64/add/add.o >/dev/null

# - [SUCCESS] lift successful
#
# - [FAIL] interpret failure
#
#    Stack dump:
#    0.	Program arguments: lli x86_64/add/main.ghidra-to-llvm.ll
#     #0 0x00007fd42dbc877b llvm::sys::PrintStackTrace(llvm::raw_ostream&) (/usr/bin/../lib/libLLVM-10.so+0x9e377b)
#     #1 0x00007fd42dbc62d4 llvm::sys::RunSignalHandlers() (/usr/bin/../lib/libLLVM-10.so+0x9e12d4)
#     #2 0x00007fd42dbc6429 (/usr/bin/../lib/libLLVM-10.so+0x9e1429)
#     #3 0x00007fd42d1d7960 __restore_rt (/usr/bin/../lib/libpthread.so.0+0x14960)
#     #4 0x00007fd42ad50637
#     #5 0x00007fd42f5592eb llvm::MCJIT::runFunction(llvm::Function*, llvm::ArrayRef<llvm::GenericValue>) (/usr/bin/../lib/libLLVM-10.so+0x23742eb)
#     #6 0x00007fd42f4fef05 llvm::ExecutionEngine::runFunctionAsMain(llvm::Function*, std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > > const&, char const* const*) (/usr/bin/../lib/libLLVM-10.so+0x2319f05)
#     #7 0x000055ce72d1fdcd main (/usr/bin/lli+0x1ddcd)
#     #8 0x00007fd42ce46002 __libc_start_main (/usr/bin/../lib/libc.so.6+0x27002)
#     #9 0x000055ce72d2153e _start (/usr/bin/lli+0x1f53e)
#
# - [FAIL] recompile failure
#
#    undefined reference to `call_indirect'
#
echo -e "Lifting x86_64/add/main\n"
./lift-ghidra-to-llvm.sh -o x86_64/add/main.ghidra-to-llvm.ll x86_64/add/main >/dev/null

echo -e "~~~ [ llvm-mctoll ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [FAIL] lift failure (no support for `*.o`)
#
#    Raising x64 relocatable (.o) x64 binaries not supported
#
#./lift-llvm-mctoll.sh -o x86_64/add/add.o.llvm-mctoll.ll x86_64/add/add.o

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
#./lift-llvm-mctoll.sh -o x86_64/add/main.llvm-mctoll.ll x86_64/add/main

echo -e "~~~ [ reopt ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret success (no main function to execute)
#
# - [SUCCESS] recompile successful
#
echo -e "Lifting x86_64/add/add.o\n"
./lift-reopt.sh --llvm --header x86_64/add/add.h -o x86_64/add/add.o.reopt.ll x86_64/add/add.o

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret success
#
# - [SUCCESS] recompile successful
#
echo -e "Lifting x86_64/add/main\n"
./lift-reopt.sh --llvm --header x86_64/add/add.h --include add --include main -o x86_64/add/main.reopt.ll x86_64/add/main

echo -e "~~~ [ retdec ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret success (no main function to execute)
#
# - [FAIL] recompile failure
#
#    undefined reference to `__decompiler_undefined_function_0'
#
echo -e "Lifting x86_64/add/add.o\n"
./lift-retdec.sh -k -o x86_64/add/add.o.retdec.c x86_64/add/add.o >/dev/null
rm -f x86_64/add/*.retdec.{bc,config.json,dsm}

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret success (return value 42)
#
# - [FAIL] recompile failure
#
#    undefined reference to `__decompiler_undefined_function_0'
#
echo -e "Lifting x86_64/add/main\n"
./lift-retdec.sh -k -o x86_64/add/main.retdec.c x86_64/add/main >/dev/null
rm -f x86_64/add/*.retdec.{bc,config.json,dsm}

echo -e "~~~ [ rev.ng ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret successful (no main function in lifted IR)
#
# - [FAIL] recompile failure (not self contained)
#
#    undefined reference to `cpu_x86_signal_handler'
#
echo -e "Lifting x86_64/add/add.o\n"
./lift-revng.sh x86_64/add/add.o x86_64/add/add.o.revng.ll
rm -f x86_64/add/*.revng.*.csv

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret successful (no main function in lifted IR)
#
# - [FAIL] recompile failure (not self contained)
#
#    undefined reference to `cpu_x86_signal_handler'
#
echo -e "Lifting x86_64/add/main\n"
./lift-revng.sh x86_64/add/main x86_64/add/main.revng.ll
rm -f x86_64/add/*.revng.*.csv

echo -e "--- [ hello ] ------------------------------------------------------------------\n"

echo -e "~~~ [ dagger ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

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
echo -e "Lifting x86_64/hello/main\n"
./lift-dagger.sh x86_64/hello/main > x86_64/hello/main.dagger.ll

echo -e "~~~ [ Ghidra-to-LLVM ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [FAIL] interpret failure
#
#    Stack dump:
#    0.	Program arguments: lli x86_64/hello/main.ghidra-to-llvm.ll
#     #0 0x00007fc3c4cad77b llvm::sys::PrintStackTrace(llvm::raw_ostream&) (/usr/bin/../lib/libLLVM-10.so+0x9e377b)
#     #1 0x00007fc3c4cab2d4 llvm::sys::RunSignalHandlers() (/usr/bin/../lib/libLLVM-10.so+0x9e12d4)
#     #2 0x00007fc3c4cab429 (/usr/bin/../lib/libLLVM-10.so+0x9e1429)
#     #3 0x00007fc3c42bc960 __restore_rt (/usr/bin/../lib/libpthread.so.0+0x14960)
#     #4 0x00007fc3c1e356e7
#     #5 0x00007fc3c663e2eb llvm::MCJIT::runFunction(llvm::Function*, llvm::ArrayRef<llvm::GenericValue>) (/usr/bin/../lib/libLLVM-10.so+0x23742eb)
#     #6 0x00007fc3c65e3f05 llvm::ExecutionEngine::runFunctionAsMain(llvm::Function*, std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > > const&, char const* const*) (/usr/bin/../lib/libLLVM-10.so+0x2319f05)
#     #7 0x0000561e2a3cadcd main (/usr/bin/lli+0x1ddcd)
#     #8 0x00007fc3c3f2b002 __libc_start_main (/usr/bin/../lib/libc.so.6+0x27002)
#     #9 0x0000561e2a3cc53e _start (/usr/bin/lli+0x1f53e)
#
# - [FAIL] recompile failure
#
#    undefined reference to `call_indirect'
#
echo -e "Lifting x86_64/hello/main\n"
./lift-ghidra-to-llvm.sh -o x86_64/hello/main.ghidra-to-llvm.ll x86_64/hello/main >/dev/null

echo -e "~~~ [ llvm-mctoll ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret successful (with minor update of main function signature)
#
#    LLVM ERROR: Invalid type for second argument of main() supplied
#
# - [SUCCESS] recompile sucessful
#
echo -e "Lifting x86_64/hello/main\n"
./lift-llvm-mctoll.sh -o x86_64/hello/main.llvm-mctoll.ll x86_64/hello/main

echo -e "~~~ [ reopt ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful (for statically compiled binary)
#
# - [FAIL] interpret failure (using char* address as integer in call to printf)
#
#    %t0 = call i64 (i64, ...) @printf(i64 4726788)
#
#    Stack dump:
#    0.	Program arguments: lli x86_64/hello/main_static.reopt.ll
#     #0 0x00007fdb392b777b llvm::sys::PrintStackTrace(llvm::raw_ostream&) (/usr/bin/../lib/libLLVM-10.so+0x9e377b)
#     #1 0x00007fdb392b52d4 llvm::sys::RunSignalHandlers() (/usr/bin/../lib/libLLVM-10.so+0x9e12d4)
#     #2 0x00007fdb392b5429 (/usr/bin/../lib/libLLVM-10.so+0x9e1429)
#     #3 0x00007fdb388c6960 __restore_rt (/usr/bin/../lib/libpthread.so.0+0x14960)
#     #4 0x00007fdb386700fc __strchrnul_avx2 (/usr/bin/../lib/libc.so.6+0x1620fc)
#     #5 0x00007fdb38578a53 __vfprintf_internal (/usr/bin/../lib/libc.so.6+0x6aa53)
#     #6 0x00007fdb38565a2f printf (/usr/bin/../lib/libc.so.6+0x57a2f)
#     #7 0x00007fdb3dcfb014
#     #8 0x00007fdb3ac48396 llvm::MCJIT::runFunction(llvm::Function*, llvm::ArrayRef<llvm::GenericValue>) (/usr/bin/../lib/libLLVM-10.so+0x2374396)
#     #9 0x00007fdb3abedf05 llvm::ExecutionEngine::runFunctionAsMain(llvm::Function*, std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > > const&, char const* const*) (/usr/bin/../lib/libLLVM-10.so+0x2319f05)
#    #10 0x000056178175cdcd main (/usr/bin/lli+0x1ddcd)
#    #11 0x00007fdb38535002 __libc_start_main (/usr/bin/../lib/libc.so.6+0x27002)
#    #12 0x000056178175e53e _start (/usr/bin/lli+0x1f53e)
#
# - [SUCCESS] recompile successful (but invalid source)
#
echo -e "Lifting x86_64/hello/main_static\n"
./lift-reopt.sh --llvm --header x86_64/hello/hello.h --include main -o x86_64/hello/main_static.reopt.ll x86_64/hello/main_static

echo -e "~~~ [ retdec ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [FAIL] interpret failure
#
#    Stack dump:
#    0.	Program arguments: lli x86_64/hello/main.retdec.ll
#    #0 0x00007f52768f377b llvm::sys::PrintStackTrace(llvm::raw_ostream&) (/usr/bin/../lib/libLLVM-10.so+0x9e377b)
#    #1 0x00007f52768f12d4 llvm::sys::RunSignalHandlers() (/usr/bin/../lib/libLLVM-10.so+0x9e12d4)
#    #2 0x00007f52768f1429 (/usr/bin/../lib/libLLVM-10.so+0x9e1429)
#    #3 0x00007f5275f02960 __restore_rt (/usr/bin/../lib/libpthread.so.0+0x14960)
#
# - [FAIL] recompile failure
#
#    undefined reference to `__decompiler_undefined_function_0'
#
echo -e "Lifting x86_64/hello/main\n"
./lift-retdec.sh -k -o x86_64/hello/main.retdec.c x86_64/hello/main >/dev/null
rm -f x86_64/hello/*.retdec.{bc,config.json,dsm}

echo -e "~~~ [ rev.ng ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [SUCCESS] lift successful
#
# - [SUCCESS] interpret successful (no main function in lifted IR)
#
# - [FAIL] recompile failure (not self contained)
#
#    undefined reference to `cpu_x86_signal_handler'
echo -e "Lifting x86_64/hello/main\n"
./lift-revng.sh x86_64/hello/main x86_64/hello/main.revng.ll
rm -f x86_64/hello/*.revng.*.csv
