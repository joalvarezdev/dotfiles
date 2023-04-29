#!/bin/bash

nmcli con down infosis &> /dev/null
nmcli con down depp3 &> /dev/null

dep=$(nmcli con up depp3)
if  echo "$dep" | grep -q "Connection successfully";then
    dep=$(nmcli con up infosis)
    if  echo "$dep" | grep -q "Connection successfully";then
        aplay ~/dev/config/dotfiles/sounds/bells_ok.wav &> /dev/null
    fi
fi
