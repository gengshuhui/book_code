gcc -g -O0 -I../sharedLib -c main.c
gcc main.o -Wl,-L../sharedLib -lsimple \
           -Wl,-R../sharedLib -o newerApp

cp ../../10.2.2.4/main/firstDemoApp .

readelf -S newerApp  |grep gnu
readelf --version-info newerApp 
readelf --dyn-syms newerApp | grep function

./newerApp
./firstDemoApp

