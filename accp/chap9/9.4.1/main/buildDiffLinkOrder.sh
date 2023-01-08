gcc -Wall -g -O0 -I../staticLib -I../sharedLib -c main.c
gcc main.o -Wl,-L../sharedLib -Wl,-lshlib \
           -Wl,-L../staticLib -Wl,-lstaticlib \
           -Wl,-R../sharedLib \
           -o clientAppDiffLinkOrder
