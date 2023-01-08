#include <stdio.h>
#include "simple.h"

int main(int argc, char* argv[]) {
  int nFirst = first_function(1); // seeing 1000 times larger return value will be fun!
  int nSecond = second_function(2);
  int nForth = forth_function(4);
  int nRetValue = nFirst + nSecond + nForth;
  printf("first(1) + second(2) + forth(4) = %d\n", nRetValue);
  return nRetValue;
}
