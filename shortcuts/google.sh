#!/bin/bash

if pgrep -x "chrome" > /dev/null
then
	wmctrl -a "Google Chrome"
else
	google-chrome-stable &
fi
