#!/bin/bash

if pgrep -x "Discord" > /dev/null
then
	wmctrl -a "Discord"
else
	~/dev/applications/Discord/Discord > /dev/null
fi
