all: hello.o main main_static

CFLAGS=-g

%.o: %.c
	clang -c $(CFLAGS) -o $@ $<

main: hello.o
	clang $(CFLAGS) -o $@ $^

main_static: hello.o
	clang -static $(CFLAGS) -o $@ $^

.PHONY: all clean

clean:
	$(RM) -v hello.o
	$(RM) -v main
	$(RM) -v main_static
