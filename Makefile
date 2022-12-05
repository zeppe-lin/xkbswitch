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
	${CC} -o $@ ${LDFLAGS} $^

install: all
	install -m 0755 -Dt ${DESTDIR}${PREFIX}/bin/     xkbswitch
	install -m 0644 -Dt ${DESTDIR}${MANPREFIX}/man1/ xkbswitch.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/xkbswitch
	rm -f ${DESTDIR}${MANPREFIX}/man1/xkbswitch.1

clean:
	rm -f xkbswitch xkbswitch.o xkbswitch.1

.PHONY: all install uninstall clean

# vim:cc=72:tw=70
# End of file.
