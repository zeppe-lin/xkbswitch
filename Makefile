# See LICENSE file for copyright and license details.

.POSIX:

include config.mk

all: xkbswitch xkbswitch.1

.c.o:
	${CC} -c ${CFLAGS} ${CPPFLAGS} $<

%: %.pod
	podchecker $^
	pod2man -c ' ' -n xkbswitch -r ${VERSION} $^ > $@

xkbswitch: xkbswitch.o
	${LD} -o $@ ${LDFLAGS} $^

install: all
	mkdir -p ${DESTDIR}${BINDIR}
	mkdir -p ${DESTDIR}${MANDIR}/man1
	cp xkbswitch   ${DESTDIR}${BINDIR}/
	cp xkbswitch.1 ${DESTDIR}${MANDIR}/man1/

uninstall:
	rm -f ${DESTDIR}${BINDIR}/xkbswitch
	rm -f ${DESTDIR}${MANDIR}/man1/xkbswitch.1

clean:
	rm -f xkbswitch xkbswitch.o xkbswitch.1

.PHONY: all install uninstall clean

# vim:cc=72:tw=70
# End of file.
