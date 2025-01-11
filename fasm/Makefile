EXEC ?= main

read_exec:
	readelf -a ${EXEC}

run:
	fasm ${EXEC}.asm && ./${EXEC}
