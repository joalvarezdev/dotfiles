#!/bin/bash

if pgrep DBeaver > /dev/null
then
	wmctrl -xa DBeaver
else
	cd ~/dev/applications/dbeaver/
	./DBeaver &
fi

