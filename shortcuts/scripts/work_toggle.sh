#!/bin/bash

if ifconfig ppp0 &> /dev/null; then
  nmcli connection down 'infosis-vpn' &> /dev/null
else
  nmcli connection up 'infosis-vpn' &> /dev/null
fi
