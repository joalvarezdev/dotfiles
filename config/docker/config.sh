#!/bin/bash

set -e

if systemctl is-enabled docker &>/dev/null; then
  exit 0
fi

sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER

newgrp docker
