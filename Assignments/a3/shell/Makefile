#
# Linux makefile
# Use with make 
#

.SUFFIXES:
.SUFFIXES: .o .asm .cpp .c

ASSIGN=a3
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

all: $(ASSIGN) asm_io.o

$(ASSIGN): driver.o $(ASSIGN).o asm_io.o
	$(CC) $(CFLAGS) -o $@ $?

asm_io.o : asm_io.asm
	$(AS) $(ASFLAGS) -d ELF_TYPE $?

$(ASSIGN).o : asm_io.inc $(ASSIGN).asm

driver.o : driver.c

clean :
	rm *.o
