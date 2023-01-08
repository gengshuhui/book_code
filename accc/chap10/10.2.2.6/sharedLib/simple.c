#include <stdio.h>
#include "simple.h"

__asm__(".symver first_function_1_0,first_function@LIBSIMPLE_1.0");
int first_function_1_0(int x) {
  printf(" lib: %s\n", __FUNCTION__);
  return (x + 1);
}

__asm__(".symver first_function_2_0,first_function@@LIBSIMPLE_2.0");
int first_function_2_0(int x) {
  printf(" lib: %s\n", __FUNCTION__);
  return (x + 1) * 1000;
}


int second_function(int x) {
  printf(" lib: %s\n", __FUNCTION__);
  return (x + 2);
}

int third_function(int x) {
  printf(" lib: %s\n", __FUNCTION__);
  return (x + 3);
}

int forth_function(int x) { // exproted in version 1.1
  printf(" lib: %s\n", __FUNCTION__);
  return (x + 4);
}
int fifth_function(int x) {
  printf(" lib: %s\n", __FUNCTION__);
  return (x + 5);
}
