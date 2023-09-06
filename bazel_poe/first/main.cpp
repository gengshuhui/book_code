#include <iostream>
#include "util/helper.h"

int main(){
  std::cout << "Hello Bazel!" << std::endl;
  int result = multiply(5, 7);
  std::cout << "Result: " << result << std::endl;
  return 0;
}
