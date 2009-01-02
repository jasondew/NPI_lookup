CC = gcc 
INCLUDES = `mysql_config --include`
LIBS = `mysql_config --libs`

all: import

import.o: import.c
	$(CC) -c $(INCLUDES) -g import.c 

import: import.o
	$(CC) -o import import.o $(LIBS) 
clean: 
	@rm -f import import.o
