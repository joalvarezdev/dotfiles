#!/bin/bash

sign_path=$MY_GH/are_you_booking/main.py
dir=$(echo "$(readlink -f "$0")" | sed 's,/shortcuts.sh,,')
param=$1

if [[ $param == 1 ]]; then
  sh $dir/connections/wifi_toggle.sh
elif [[ $param == 2 ]]; then
  sh $dir/connections/work_toggle.sh
elif [[ $param == 3 ]]; then
  python $sign_path
fi
