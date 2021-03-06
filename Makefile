# constants
CC = g++
CFLAGS = -I. -Wall -std=c++17 -g
OUT = sponge

sponge: sponge.cc sponge.h
	$(CC) -o $(OUT) $(CFLAGS) sponge.cc

install: clean sponge deps
	ln -s $(shell pwd)/sponge /home/${USER}/.local/bin/sponge 

clean:
	rm sponge

style: sponge.cc sponge.h
	clang-format -i sponge.cc sponge.h

deps:
	.integrations/checkdeps.sh
