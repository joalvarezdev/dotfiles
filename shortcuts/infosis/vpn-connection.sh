#!/bin/bash

source $HOME/dotfiles/shortcuts/bw/functions.sh

CONNECTION="infosis"
PASSWORD=$(load_vpn_pass "1dc3d5bf-cfec-4e32-922d-ad0760fc5238")

if nmcli connection show --active | grep -q "^$CONNECTION"; then
  nmcli connection down "$CONNECTION"
else
  echo "$PASSWORD" | nmcli --ask connection up "$CONNECTION"
fi
