gcc target.c -g -finstrument-functions -o bin.elf
./bin.elf
#
#root@coder:# ./bin.elf
#Entering in 0x561211e00791 from 0x7fafa008fb97...
#I'm a target C program in main.
#Entering in 0x561211e00758 from 0x561211e007c3...
#I'm a target C program in f1.
#Exiting from 0x561211e00758 to 0x561211e007c3...
#Exiting from 0x561211e00791 to 0x7fafa008fb97...
# 左边是本函数，如f，右边是f的调用者调用f后的下一个指令地址
objdump -d bin.elf
readelf -s bin.elf



