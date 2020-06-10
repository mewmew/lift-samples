all: locals.o main main_static

CFLAGS=-g

%.o: %.c
	clang -c $(CFLAGS) -o $@ $<

main: locals.o
	clang $(CFLAGS) -o $@ $^

main_static: locals.o
	clang -static $(CFLAGS) -o $@ $^

.PHONY: all clean

clean:
	$(RM) -v locals.o
	$(RM) -v main
	$(RM) -v main_static
