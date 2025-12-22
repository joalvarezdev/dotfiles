#!/bin/bash

## BASE 64 

decode() {
  echo "$1" | base64 -d | xclip -selection clipboard
}

encode() {
  echo -n "$1" | base64 | xclip -selection clipboard
}

## RED

fix::wifi() {
  sudo systemctl restart iwd
}
