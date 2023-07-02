#!/bin/bash

if ifconfig ppp0 &> /dev/null; then
  nmcli connection down 'infosis' &> /dev/null
else
  nmcli connection up 'infosis' &> /dev/null
fi
