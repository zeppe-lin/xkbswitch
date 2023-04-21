.POSIX:

include config.mk

all: xkbswitch xkbswitch.1

.c.o:
	${CC} -c ${CFLAGS} ${CPPFLAGS} $<

xkbswitch: xkbswitch.o
	${LD} xkbswitch.o ${LDFLAGS} -o $@

xkbswitch.1:
	sed "s/@VERSION@/${VERSION}/g" xkbswitch.1.in > $@

install: all
	mkdir -p          ${DESTDIR}${PREFIX}/bin
	mkdir -p          ${DESTDIR}${MANPREFIX}/man1
	cp -f xkbswitch   ${DESTDIR}${PREFIX}/bin/
	cp -f xkbswitch.1 ${DESTDIR}${MANPREFIX}/man1/
	chmod 0755        ${DESTDIR}${PREFIX}/bin/xkbswitch
	chmod 0644        ${DESTDIR}${MANPREFIX}/man1/xkbswitch.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/xkbswitch
	rm -f ${DESTDIR}${MANPREFIX}/man1/xkbswitch.1

clean:
	rm -f xkbswitch xkbswitch.o xkbswitch.1
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all install uninstall clean dist
