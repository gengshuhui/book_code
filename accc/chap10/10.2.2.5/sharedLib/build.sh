gcc -Wall -O0 -fPIC -c simple.c
gcc -shared simple.o -Wl,--version-script,simpleVersionScript -Wl,-soname,libsimple.so.1 -o libsimple.so.1.0.0
ldconfig -n .
ln -s libsimple.so.1 libsimple.so

readelf -S -W libsimple.so | grep gnu
readelf --version-info libsimple.so # -V
readelf --symbols libsimple.so | grep function # -s
readelf --dyn-syms libsimple.so #| grep function
