gcc -Wall -g -O0 -I../staticLib -I../sharedLib -c main.c
gcc main.o -Wl,-L../staticLib -Wl,-lstaticlib \
           -Wl,-L../sharedLib -Wl,-lshlib \
           -Wl,-R../sharedLib \
           -o clientApp
