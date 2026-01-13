all:
	v -cc gcc -cflags -static -prod rdrand.v
	./rdrand
