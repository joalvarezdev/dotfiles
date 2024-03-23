#!/usr/bin/bash

# RELOAD ZSH CONFIGURATION
alias so='source ~/.zshrc'

# SHORCUTS NMCLI
alias conns='nmcli connection show'
alias connu='nmcli connection up $1 &> /dev/null'
alias connd='nmcli connection down $1 &> /dev/null'

# Personal work
alias dep=$MY_GH
alias dot=$DOTFILES

# NVIM
alias n=nvim
