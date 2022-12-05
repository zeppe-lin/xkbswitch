# See LICENSE file for copyright and license details.

# xkbswitch version
VERSION = 0.1.3

# customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/local/include
X11LIB = /usr/local/lib

# includes and libs
INCS = -I${X11INC}
LIBS = -L${X11LIB} -lX11

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_S_SOURCE=200809L \
	   -DVERSION=\"${VERSION}\" ${INCS}
CFLAGS = -std=c99 -pedantic -Wall -Wextra
LDFLAGS = ${LIBS}

# compiler and linker
CC = cc

# vim:cc=72:tw=70
# End of file.
