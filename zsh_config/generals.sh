#!/bin/bash

alias ls='exa --icons'
alias la='exa --icons -a'
alias lsa='exa --icons -la'

dotfiles=$HOME/dotfiles

source $dotfiles/scripts/nvm/nvm.sh
source $dotfiles/scripts/bw/bw.sh
source $dotfiles/zsh_config/.tmux_init
source $dotfiles/zsh_config/.zsh_autosuggestion
source $dotfiles/scripts/infosis/init.sh
source $dotfiles/scripts/tools/cli_tools.sh
source $dotfiles/scripts/git/git_custom_alias.sh
source $dotfiles/zsh_config/.pyenv

source $dotfiles/shortcuts/aliases/generals.sh
source $dotfiles/shortcuts/aliases/proyects.sh
