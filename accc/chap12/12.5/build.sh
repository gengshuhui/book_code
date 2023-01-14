set -x
rm -f *.a
gcc -Wall -c first.c second.c third.c forth.c
ar -rcs libmystaticlib.a first.o second.o third.o forth.o
ls -alg
ar -t libmystaticlib.a
ar -d libmystaticlib.a third.o
ar -t libmystaticlib.a
ar -r libmystaticlib.a third.o
ar -t libmystaticlib.a
ar -m -b forth.o libmystaticlib.a third.o
ar -t libmystaticlib.a

rm libmystaticlib.a
ar -rcs libmystaticlib.a first.o second.o third.o forth.o
ar -t libmystaticlib.a
ar -d libmystaticlib.a third.o
ar -t libmystaticlib.a
#use relative path
ar -r -b forth.o libmystaticlib.a third.o
ar -t libmystaticlib.a

rm *.a *.o
