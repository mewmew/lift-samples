all: x86_32 x86_64

x86_32:
	make -C x86_32

x86_64:
	make -C x86_64

.PHONY: all clean

clean:
	make -C x86_32 clean
	make -C x86_64 clean
