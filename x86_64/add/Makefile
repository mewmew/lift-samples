all: add.o main

%.o: %.asm
	nasm -g -f elf64 -o $@ $<

CFLAGS=-g

%.o: %.c
	clang -c $(CFLAGS) -o $@ $<

main: main.o add.o
	clang $(CFLAGS) -o $@ $^

.PHONY: all clean

clean:
	$(RM) -v add.o
	$(RM) -v main.o
	$(RM) -v main
