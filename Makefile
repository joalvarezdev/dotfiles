SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
SCRIPT_DIR = $(ROOT_DIR)/scripts
CONFIGURATION = $(SCRIPT_DIR)/configuration
VIEW = $(SCRIPT_DIR)/visualization

# EXECUTABLE COMMANDS
GHQ = $(CONFIGURATION)/ghq.sh
ALACRITTY = $(CONFIGURATION)/alacritty.sh
NVM = $(CONFIGURATION)/nvm.sh
ZSH = $(CONFIGURATION)/zsh.sh

OH_MY_ZSH = $(VIEW)/zsh-viz.sh


init:
	$(GHQ)
	$(ALACRITTY)
	$(NVM)
	$(ZSH)

viz:
	$(OH_MY_ZSH)
