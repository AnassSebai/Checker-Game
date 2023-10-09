CC = gcc
CFLAGS = -Wall -Wextra -Werror -pedantic -std=c99 $(pkg-config --cflags sdl2)
LDFLAGS = $(pkg-config --libs sdl2)

all: dames

dames: dames.c board.o list.o minmax.o jeu.o
	$(CC) $(CFLAGS) dames.c board.o list.o minmax.o jeu.o -o dames $(LDFLAGS)

board.o: board.c board.h
	$(CC) $(CFLAGS) -c board.c 

list.o: list.c list.h
	$(CC) $(CFLAGS) -c list.c 

minmax.o: minmax.c minmax.h
	$(CC) $(CFLAGS) -c minmax.c 

jeu.o: jeu.c jeu.h
	$(CC) $(CFLAGS) -c jeu.c 

clean:
	rm -f *.o dames
