# Make a shared object library to call from Julia

CC = gcc
CFLAGS = -std=c99 -O3 -Wall -fPIC
LIBFLAGS = -shared

default: libcme257

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

libcme257: cme257.o
	#$(CC) -o libcme257.dylib cme257.o $(LIBFLAGS) # for mac
	$(CC) -o libcme257.so cme257.o $(LIBFLAGS) # for linux

clean:
	rm -rf *.o *.so *.o *~ *.pyc *.dylib
