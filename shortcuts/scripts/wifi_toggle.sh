#!/bin/bash

wifi="$(iwgetid -r)"

if [[ -z "$wifi" ]]; then
  nmcli connection up Rocco &> /dev/null
else
  nmcli connection down $wifi &> /dev/null
fi
