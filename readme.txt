how to compile and run each program:
ada: 
	gnatmake -Wall spigot.adb
	./spigot
C: 
	gcc -Wall spigot.c
	./a.out
fortran:
	gfortran -Wall spigot.f95 
	./a.out
python:
	python spigot.py
