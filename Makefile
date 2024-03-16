SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
SCRIPT_DIR = $(ROOT_DIR)/scripts
CONFIGURATION = $(SCRIPT_DIR)/configuration

# EXECUTABLE COMMANDS
GHQ = $(CONFIGURATION)/ghq.sh
ALACRITTY = $(CONFIGURATION)/alacritty.sh
NVM = $(CONFIGURATION)/nvm.sh
ZSH = $(CONFIGURATION)/zsh.sh


init:
	$(GHQ)
	$(ALACRITTY)
	$(NVM)
	$(ZSH)
