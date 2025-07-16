#!/usr/bin/bash

# Default Values
DEFAULT_USERNAME="zeus"
DEFAULT_PASSWORD="infosis"

# Parameter Reading
USERNAME=${1:-$DEFAULT_USERNAME}
PASSWORD=${2:-$DEFAULT_PASSWORD}

ENCODE_CREDENTIALS=$(echo -n "${USERNAME}:${PASSWORD}" | base64)

ACCESS_TOKEN=$(curl -s --location --request POST 'https://auth-test.infosis.tech/oauth/token?grant_type=client_credentials' \
  --header "Authorization: Basic $ENCODE_CREDENTIALS" | jq -r '.access_token')

if [ -z "$ACCESS_TOKEN" ]; then
  exit 1
fi

echo -n "$ACCESS_TOKEN" | xclip -selection clipboard
