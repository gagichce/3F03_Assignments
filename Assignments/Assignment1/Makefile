#
# Linux makefile
# Use with make 
#

.SUFFIXES:
.SUFFIXES: .o .asm .cpp .c

AS=nasm
ASFLAGS= -f elf
CFLAGS= -m32
CC=gcc
CXX=g++
CXXFLAGS=
LDFLAGS= -m32

.asm.o:
	$(AS) $(ASFLAGS) $*.asm

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $*.cpp

.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: a1asm asm_io.o

a1asm: driver.o a1asm.o asm_io.o
	$(CC) $(CFLAGS) -o a1asm driver.o a1asm.o asm_io.o

asm_io.o : asm_io.asm
	$(AS) $(ASFLAGS) -d ELF_TYPE asm_io.asm

a1p5.o : asm_io.inc a1asm.asm

driver.o : driver.c

clean :
	rm *.o
