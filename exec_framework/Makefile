all: run

run: build
	xfce4-terminal -H -x lua run.lua

build:
	moonc *.moon
	make -C plugins
	make -C libs
