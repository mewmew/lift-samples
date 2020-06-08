all: hello.o main

CFLAGS=-g

%.o: %.c
	clang -c $(CFLAGS) -o $@ $<

main: hello.o
	clang $(CFLAGS) -o $@ $^

.PHONY: all clean

clean:
	$(RM) -v hello.o
	$(RM) -v main
