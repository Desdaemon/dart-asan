main: main.c
	clang -fPIC -fsanitize=address -shared-libasan -c main.c -o main.o
	clang -shared -Wl -o main main.o
	rm main.o
