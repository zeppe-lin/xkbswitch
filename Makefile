.POSIX:

include config.mk

all: xkbswitch

.c.o:
	${CC} -c ${CFLAGS} ${CPPFLAGS} $<

xkbswitch: xkbswitch.o
	${LD} xkbswitch.o ${LDFLAGS} -o $@

xkbswitch.1: xkbswitch.1.in

install: all
	mkdir -p          ${DESTDIR}${PREFIX}/bin
	mkdir -p          ${DESTDIR}${MANPREFIX}/man1
	cp -f xkbswitch   ${DESTDIR}${PREFIX}/bin/
	sed "s/@VERSION@/${VERSION}/" xkbswitch.1.in > \
		${DESTDIR}${MANPREFIX}/man1/xkbswitch.1
	chmod 0755        ${DESTDIR}${PREFIX}/bin/xkbswitch
	chmod 0644        ${DESTDIR}${MANPREFIX}/man1/xkbswitch.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/xkbswitch
	rm -f ${DESTDIR}${MANPREFIX}/man1/xkbswitch.1

clean:
	rm -f xkbswitch xkbswitch.o

.PHONY: all install uninstall clean
