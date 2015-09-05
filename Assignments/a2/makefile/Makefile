#	Changes made:
# 	removed .cpp rule, only needed for one line
#	simplified rule lines by replacing targets and prereqs to $@ and $? where possible
#	removed most rules as the general suffix rules are sufficeint.
#	made custom rule to combine build for prime math first sub1 sub2 sub3
#	combined sub1.o sub2.o sub3.o sub4.o main4.o into one, all relied on asm_io.inc
#	did not remove whitespace between lines. readability > less lines

.SUFFIXES:
.SUFFIXES: .o .asm .cpp .c

AS=nasm
ASFLAGS= -f elf
CFLAGS= -m32
CC=gcc
CXX=g++
CXXFLAGS= -m32
LDFLAGS= -m32

.asm.o: ; $(AS) $(ASFLAGS) $*.asm

.c.o: ; $(CC) -c $(CFLAGS) $*.c

all: prime math sub1 sub2 sub3 sub4 sub5 sub6 first memex dmaxt asm_io.o fprime quadt test_big_int

prime math first sub1 sub2 sub3: driver.o asm_io.o
	$(AS) $(ASFLAGS) $@.asm
	$(CC) $(CFLAGS) -o $@ $@.o $?

sub4 : driver.o sub4.o main4.o asm_io.o

sub5 : main5.o sub5.o asm_io.o

sub6 : main6.o sub6.o

asm_io.o : asm_io.asm
	$(AS) $(ASFLAGS) -d ELF_TYPE $?

array1 : driver.o array1.o array1c.o

memex : memex.o memory.o

dmaxt : dmaxt.o dmax.o

quadt : quadt.o quad.o

readt : readt.o read.o

fprime : fprime.o prime2.o

test_big_int : test_big_int.o big_int.o big_math.o
	$(CXX) $(CXXFLAGS) -o $@ $?

first.o : asm_io.inc first.asm

sub1.o sub2.o sub3.o sub4.o main4.o : asm_io.inc

clean :
	rm *.o
