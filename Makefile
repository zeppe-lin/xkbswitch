include config.mk

all: xkbswitch xkbswitch.1

.c.o:
	$(CC) $(CFLAGS) -c $<

xkbswitch.1: README.pod
	pod2man -c "General Commands Manual" -s 1 -n xkbswitch -r $(VERSION) \
		$^ > $@

xkbswitch: xkbswitch.o
	$(CC) -o $@ $^ $(LDFLAGS)

install: all
	install -d $(DESTDIR)/usr/{bin,share/man/man1}
	install -m 755 xkbswitch   $(DESTDIR)/usr/bin/
	install -m 644 xkbswitch.1 $(DESTDIR)/usr/share/man/man1/

uninstall:
	rm -f $(DESTDIR)/usr/{bin,share/man/man1}/xkbswitch{,.1}

clean:
	rm -f xkbswitch{,.o,.1}


.PHONY: all install uninstall clean
