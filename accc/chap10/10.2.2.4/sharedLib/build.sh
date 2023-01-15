gcc -Wall -g -O0 -fPIC -c simple.c
gcc -shared simple.o -Wl,--version-script,simpleVersionScript -Wl,-soname,libsimple.so.1 -o libsimple.so.1.0.0
ldconfig -n .
ln -s libsimple.so.1 libsimple.so

readelf -S -W libsimple.so.1 | grep gnu
readelf --version-info libsimple.so.1 # -V
readelf --symbols libsimple.so.1 | grep function # -s
readelf --dyn-syms libsimple.so.1 #| grep function
