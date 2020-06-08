echo "=== [ x86_32 ] ================================================================="

echo "--- [ add ] --------------------------------------------------------------------"

echo "~~~ [ dagger ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# - [FAILURE] lift failure
#
#    LLVM ERROR: Found stripped ELF file, could not find entrypoint.
#
echo -e "Lifting x86_32/add/add.o\n"
./lift-dagger.sh x86_32/add/add.o > x86_32/add/add.dagger.ll

# - [FAILURE] lift failure (no support for x86_32)
#
#    error: no dc translator for target i386-unknown-unknown
#
echo -e "Lifting x86_32/add/main\n"
./lift-dagger.sh x86_32/add/main > x86_32/add/main.dagger.ll

echo "~~~ [ llvm-mctoll ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# - [FAIL] lift failure (no support for x86_32)
#
#    No support to raise Binaries other than x64 and ARM
#
echo -e "Lifting x86_32/add/add.o\n"
./lift-llvm-mctoll.sh x86_32/add/add.o

echo -e "~~~ [ reopt ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

# - [FAIL] lift failure (no support for x86_32)
#
#    32-bit elf files are not yet supported.
#
echo -e "Lifting x86_32/add/add.o\n"
./lift-reopt.sh --llvm --header x86_32/add/add.h -o x86_32/add/add.o.reopt.ll x86_32/add/add.o
