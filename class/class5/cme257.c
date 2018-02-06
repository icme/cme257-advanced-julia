// c file intended to be compiled as a shared object library
#include <stdlib.h>
#include <stdio.h>

void hello();
int c_sum(int a, int b);

void hello() {
  printf("hello world!");
}

int c_sum(int a, int b) {
  return a + b;
}
