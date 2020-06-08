all: hello.o main

CFLAGS=-g -m32

%.o: %.c
	clang -c $(CFLAGS) -o $@ $<

main: hello.o
	clang $(CFLAGS) -o $@ $^

.PHONY: all clean

clean:
	$(RM) -v hello.o
	$(RM) -v main
