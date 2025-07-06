#include <stdio.h>

extern int test1();
extern int test2();

int main()
{
        printf("Hello, world!\n");
        test1();
        test2();
}
