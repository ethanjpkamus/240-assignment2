#Author: Ethan Kamus
#email: ethanjpkamus@csu.fullerton.edu

rm *.o
rm *.out

echo "Welcome to Assignment 2"

echo "Assemble the module assignment2.asm"
nasm -f elf64 -l assignment2.lis -o assignment2.o assignment2.asm

echo "Compile the C module driver.c"
gcc -c -m64 -Wall -std=c11 -o driver.o driver.c -fno-pie -no-pie

echo "Use the C Linker to create the executable file"
gcc -m64 -std=c11 -o assignment2.out driver.o assignment2.o -fno-pie -no-pie

echo "Run Assignment 2"
./assignment2.out

echo "The bash scipt is now closing"
