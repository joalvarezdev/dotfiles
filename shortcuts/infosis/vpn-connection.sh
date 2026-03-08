#!/bin/bash

source $HOME/dotfiles/shortcuts/bw/functions.sh

CONNECTION="infosis-vpn"
PASSWORD=$(load_vpn_pass "a0b5d6c5-05af-4f0d-b84d-b40701716861")

if nmcli connection show --active | grep -q "^$CONNECTION"; then
  nmcli connection down "$CONNECTION"
else
  echo "$PASSWORD" | nmcli --ask connection up "$CONNECTION"
fi
