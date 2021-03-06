CC = gcc
PREFIX ?= /usr/local
CFLAGS = -g -Wall -I${PREFIX}/apr/include/apr-1/
CFLAGS += -I${PREFIX}/apr/include/apr-util-1/
LDFLAGS = -L${PREFIX}/apr/lib -lapr-1 -pthread -laprutil-1 -lexpat

all: devpkg

devpkg: bstrlib.o db.o shell.o commands.o devpkg.c
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

install: all
	install -d $(DESTDIR)/$(PREFIX)/bin/
	install devpkg $(DESTDIR)/$(PREFIX)/bin/

clean:
	rm -f *.o
	rm -f devpkg

