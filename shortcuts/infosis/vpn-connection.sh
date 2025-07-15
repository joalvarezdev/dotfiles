#!/bin/bash

CONNECTION="infosis"
PASSWORD="r(6bjuysz:I\\"

if nmcli connection show --active | grep -q "^$CONNECTION"; then
  nmcli connection down "$CONNECTION"
else
  echo "$PASSWORD" | nmcli --ask connection up "$CONNECTION"
fi
