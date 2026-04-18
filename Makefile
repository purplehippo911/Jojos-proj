CFLAGS = -Wall -Wextra -lpthread -lm

all: src/main.c 
	gcc -g -O0 $(CFLAGS) -o bin/jojos src/main.c
