#include <stdio.h>
#include "simple.h"

int first_function(int x) {
  printf(" lib: %s\n", __FUNCTION__);
  return (x + 1);
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
