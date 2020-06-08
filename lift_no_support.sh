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
