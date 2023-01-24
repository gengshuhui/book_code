# link time interpositioning
gcc -g -O0 -DLINKTIME -c mymalloc.c
gcc -g -O0 -c int.c

gcc -g -O0 -Wl,--wrap,malloc -Wl,--wrap,free -o intl.elf int.o mymalloc.o

