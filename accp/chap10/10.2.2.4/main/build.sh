gcc -g -O0 -I../sharedLib -c main.c
gcc main.o -Wl,-L../sharedLib -lsimple \
           -Wl,-R../sharedLib -o firstDemoApp

readelf -S firstDemoApp  |grep gnu
readelf --version-info firstDemoApp 

