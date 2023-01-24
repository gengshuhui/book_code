# gcc 7.5 not work, gcc 9.4 work ok
gcc target.c -g -fpatchable-function-entry=10 -o bin_patchable.elf
gcc target.c -g -o bin.elf
objdump -d bin_patchable.elf > dis_patchable.s
objdump -d bin.elf > dis.s

diff -y dis.s dis_patchable.s
