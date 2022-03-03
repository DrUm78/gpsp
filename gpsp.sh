#!/bin/sh
# Compare md5 of the gpSP binary in /usr/games with the OPK one
if [ `md5sum /usr/games/gpsp | cut -d' ' -f1` != `md5sum gpsp | cut -d' ' -f1` ]; then
	rw
	cp -f gpsp /usr/games
	cp -f gba_launch_gpsp.sh /usr/games/launchers
	cp -f instant_play /usr/local/sbin
	ro
fi
exec /usr/games/launchers/gba_launch_gpsp.sh "$1"
