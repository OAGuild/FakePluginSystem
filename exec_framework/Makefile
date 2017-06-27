all: run

run: build
	lua run.lua

build:
	moonc *.moon
	make -C plugins
	make -C libs
