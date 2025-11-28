#!/bin/bash

decode() {
  echo "$1" | base64 -d
}
