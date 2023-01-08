gcc -g -O0 -I../sharedLib -c main.c
gcc main.o -Wl,-L../sharedLib -lsimple \
           -Wl,-R../sharedLib -o ver2PeerApp

cp ../../10.2.2.4/main/firstDemoApp .
cp ../../10.2.2.5/main/newerApp .

readelf -S ver2PeerApp  |grep gnu
readelf --version-info ver2PeerApp 
readelf --dyn-syms ver2PeerApp | grep function

./firstDemoApp
./newerApp
./ver2PeerApp

