SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
SCRIPT_DIR = $(ROOT_DIR)/scripts
CONFIGURATION = $(SCRIPT_DIR)/configuration

# EXECUTABLE COMMANDS
GHQ = $(CONFIGURATION)/ghq.sh
ALACRITTY = $(CONFIGURATION)/alacritty.sh


init:
	$(GHQ)
	$(ALACRITTY)
