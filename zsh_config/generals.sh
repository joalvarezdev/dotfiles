#!/bin/bash

alias ls='exa --icons'
alias la='exa --icons -a'
alias lsa='exa --icons -la'

source $DOTFILES/scripts/bw/bw.sh
source $DOTFILES/scripts/nvm/nvm.sh
source $DOTFILES/zsh_config/.tmux_init
source $DOTFILES/zsh_config/.zsh_autosuggestion
source $DOTFILES/scripts/infosis/init.sh
source $DOTFILES/scripts/tools/cli_tools.sh
source $DOTFILES/scripts/git/git_custom_alias.sh
source $DOTFILES/zsh_config/.pyenv

source $DOTFILES/shortcuts/aliases/generals.sh
source $DOTFILES/shortcuts/aliases/proyects.sh
