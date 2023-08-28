# project metadata
NAME      = xkbswitch
VERSION   = 0.1.6
DIST      = ${NAME}-${VERSION}

# paths
PREFIX    = /usr/local
MANPREFIX = ${PREFIX}/share/man

# DragonFlyBSD, FreeBSD
#X11INC   = /usr/local/include
#X11LIB   = /usr/local/lib

# NetBSD, OpenBSD
#X11INC   = /usr/X11R6/include
#X11LIB   = /usr/X11R6/lib

# Linux
X11INC    = /usr/include
X11LIB    = /usr/lib

# includes and libs
INCS      = -I${X11INC}
LIBS      = -L${X11LIB} -lX11

# flags
CFLAGS    = -pedantic -Wall -Wextra \
	    -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_S_SOURCE=200809L \
	    -DVERSION=\"${VERSION}\" ${INCS}
LDFLAGS   = ${LIBS}
