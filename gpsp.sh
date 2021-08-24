#!/bin/sh
# Compare md5 of the gpSP binary in /usr/games with the OPK one
if [ `md5sum /usr/games/gpsp | cut -d' ' -f1` != `md5sum gpsp | cut -d' ' -f1` ]; then
	rw
	cp -f gpsp /usr/games
	ro
fi
exec /usr/games/launchers/gba_launch_gpsp.sh "$1"
