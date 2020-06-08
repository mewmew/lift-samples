all: add.o main

%.o: %.asm
	nasm -g -f elf32 -o $@ $<

CFLAGS=-g -m32

%.o: %.c
	clang -c $(CFLAGS) -o $@ $<

main: main.o add.o
	clang $(CFLAGS) -o $@ $^

.PHONY: all clean

clean:
	$(RM) -v add.o
	$(RM) -v main
