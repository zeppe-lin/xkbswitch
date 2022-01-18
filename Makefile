# See LICENSE file for copyright and license details.

.POSIX:

include config.mk

all: xkbswitch xkbswitch.1

.c.o:
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $<

xkbswitch.1: README.pod
	pod2man -c "General Commands Manual" -s 1 -n xkbswitch \
		-r $(VERSION) $^ > $@

xkbswitch: xkbswitch.o
	$(CC) -o $@ $(LDFLAGS) $^ $(LDLIBS)

install: all
	install -m 755 -Dt $(DESTDIR)$(PREFIX)/bin/     xkbswitch
	install -m 644 -Dt $(DESTDIR)$(MANPREFIX)/man1/ xkbswitch.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/xkbswitch
	rm -f $(DESTDIR)$(MANPREFIX)/man1/xkbswitch.1

clean:
	rm xkbswitch xkbswitch.o xkbswitch.1


.PHONY: all install uninstall clean
