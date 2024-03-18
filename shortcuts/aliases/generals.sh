#!/usr/bin/bash

# RELOAD ZSH CONFIGURATION
alias so='source ~/.zshrc'

# ADD SSH KEY PERS
alias jopershub='$DOTFILES/shortcuts/jopers.exp &> /dev/null'

# SHORCUTS NMCLI
alias conns='nmcli connection show'
alias connu='nmcli connection up $1 &> /dev/null'
alias connd='nmcli connection down $1 &> /dev/null'

# Personal work
alias dep=$MY_GH
