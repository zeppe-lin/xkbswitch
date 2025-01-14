.POSIX:

include config.mk

all: xkbswitch

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	cp -f xkbswitch ${DESTDIR}${PREFIX}/bin/
	cp -f xkbswitch.1 ${DESTDIR}${MANPREFIX}/man1/
	chmod 0755 ${DESTDIR}${PREFIX}/bin/xkbswitch
	chmod 0644 ${DESTDIR}${MANPREFIX}/man1/xkbswitch.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/xkbswitch
	rm -f ${DESTDIR}${MANPREFIX}/man1/xkbswitch.1

clean:
	rm -f xkbswitch
	rm -f ${DIST}.tar.gz

release:
	git tag -a v$(VERSION) -m v$(VERSION)

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all install uninstall clean release dist
