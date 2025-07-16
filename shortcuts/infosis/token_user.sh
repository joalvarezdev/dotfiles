#!/usr/bin/bash

# Default Values
DEFAULT_USERNAME="desarrolloequipodar"
DEFAULT_PASSWORD="zeus*1234"

# Parameter Reading
USERNAME=${1:-$DEFAULT_USERNAME}
PASSWORD=${2:-$DEFAULT_PASSWORD}

ACCESS_TOKEN=$(curl -s -X POST "https://auth-test.infosis.tech/authenticate?password=$PASSWORD&username=$USERNAME" | jq -r '.access_token')

if [ -z "$ACCESS_TOKEN" ]; then
  exit 1
fi

echo -n "$ACCESS_TOKEN" | xclip -selection clipboard
