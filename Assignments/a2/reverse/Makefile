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
CXXFLAGS= -m32
LDFLAGS= -m32

.asm.o:
	$(AS) $(ASFLAGS) $*.asm

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $*.cpp

.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: a2asm asm_io.o

a2asm: driver.o a2asm.o asm_io.o
	$(CC) $(CFLAGS) -o $@ $?

asm_io.o : asm_io.asm
	$(AS) $(ASFLAGS) -d ELF_TYPE $?

a2asm.o : asm_io.inc a2asm.asm

driver.o : driver.c

clean :
	rm *.o
