long locals(long x, long y) {
	long z = 10;
	z += x;
	z *= y;
	return z;
}

int main(int argc, char **argv) {
	return locals(11, 2);
}
