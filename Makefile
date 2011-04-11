#    Makefile for  inserting dtrace probes into prime number find.
#
# 
#      header files:    
#  
#
#          /System/Library/Frameworks/Kernel.framework/Versions/A/Headers/mach/machine/sdt.h
#          /System/Library/Frameworks/Kernel.framework/Versions/A/Headers/mach/sdt.h
#
#          
#      c files:         prime_num_dtr.c
#
#      dtrace -h -s  aProvider.d

HDR=

CC=gcc
CFLAGS=-c -Wall
DEPS=probes.h
CMPL_H=probes.h
OBJ=prime_num_dtr.o
LIBS=

DTR_HDR_COMPILER=dtrace
DTR_HDR_FLAGS=-h -s

AOUT=primes

all: $(AOUT)

$(AOUT): prime_num_dtr.o probes.h
	$(CC) prime_num_dtr.o  -o  $(AOUT)

     ##    Make the header files from the  dtrace provider definition files.
probes.h: probes.d
	$(DTR_HDR_COMPILER)  $(DTR_HDR_FLAGS) probes.d   -o probes.h


prime_num_dtr.o: prime_num_dtr.c   probes.h
	$(CC) $(CFLAGS) prime_num_dtr.c


clean:
	rm -rf  *.o  *~  


realclean: clean
	rm -rf  $(CMPL_H)  $(AOUT) 

##
#  $(AOUT): $(OBJ)
#  	gcc -o $@ $^ $(CFLAGS) $(LIBS)
##  