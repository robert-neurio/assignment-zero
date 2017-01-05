## This is a simple Makefile with lost of comments 
## Check Unix Programming Tools handout for more info.

# Define what compiler to use and the flags.
CC=cc
CXX=CC
CCFLAGS= -g 

# A rule in Makefile has the form:
#
# target: dependencies
#	command
#
# where "target" and "dependencies" are files (most of the time).
# These means that if "target" does not exist or the modification 
# date of the dependencies are older than the modification time of
# "target" then "command" is executed.
#
# For example, the rule 
#
# mystring.o : mystring.c
#	$(CC) -c $(CCFLAGS) mystring.c
#
# means that if mystring.o does not exist, or if mystring.c is older
# than mystring.o, then execute "$(CC) -c $(CCFLAGS) mystring.c".
#
# The goal of make is to execute the minimum set of commands that
# are necessary to build the target files.
#
# Usually, the first target in a Makefile is called "all". 
# The dependencies of "all" are the files that we want to build.
#

#all: test_mystring test_list test_mysort test
all: test_mystring 

# Compile mystring.o if necessary
mystring.o : mystring.c
	$(CC) -c $(CCFLAGS) mystring.c

# Compile test_mystring.o if necessary
test_mystring.o : test_mystring.c
	$(CC) -c $(CCFLAGS) test_mystring.c

# Build test_mystring if necessary
test_mystring: mystring.o test_mystring.o
	$(CC) -o test_mystring mystring.o test_mystring.o

# Build test_list

test:
	rm -f test_results
	./test_mystring && \
		(echo "test_mystring OK" >> test_results) || \
		(echo "test_mystring Failed" >> test_results) && \
	echo && \
	echo ------ Test Results ----- && \
	cat test_results 

clean:
	rm -f core *.o test_mystring test_list test_mysort test_results

