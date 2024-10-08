/* See LICENSE file for copyright and license details. */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <err.h>
/* libX11 */
#include <X11/Xlib.h>
#include <X11/XKBlib.h>

int
main(int argc, char **argv)
{
	int xkbEventType, xkbError, xkbReason;
	int mjr = XkbMajorVersion, mnr = XkbMinorVersion;
	Display *display = NULL;
	XkbStateRec state;
	Bool rv = True;

	display = XkbOpenDisplay(NULL, &xkbEventType, &xkbError, &mjr,
	                         &mnr, &xkbReason);
	if (display == NULL) {
		warnx("Cannot open X display %s", XDisplayName(NULL));

		switch (xkbReason) {
		case XkbOD_BadServerVersion:
			warnx("Bad X11 server version");
			break;
		case XkbOD_BadLibraryVersion:
			warnx("Bad XKB library version");
			break;
		case XkbOD_ConnectionRefused:
			warnx("Connection to X server refused");
			break;
		case XkbOD_NonXkbServer:
			warnx("XKB extension is not present");
			break;
		default:
			warnx("Unknown error from XkbOpenDisplay: %d",
			      xkbReason);
			break;
		}
		exit(1);
	}

	if (argc == 1) {
		/*
		 * Get layout group index in [0..3].
		 */
		rv = XkbGetState(display, XkbUseCoreKbd, &state);
		printf("%d\n", state.group);

	} else if (argc == 2) {
		/*
		 * Set layout or print usage msg if arg is not in [0..3].
		 */
		if (strlen(argv[1]) > 1 || argv[1][0] < 48 ||
		    argv[1][0] > 51)
			goto usage;

		rv = XkbLockGroup(display, XkbUseCoreKbd, atoi(argv[1]));
	} else {
usage:
		printf("Usage: %s [0..3]\n"
		       "Set/Get current layout group index in range "
		       "[0..3].\n", argv[0]);
	}

	XCloseDisplay(display);
	return rv ? 0 : 1;
}

/* vim: cc=72 tw=70
 * End of file. */
