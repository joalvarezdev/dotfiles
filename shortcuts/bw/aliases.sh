#!/bin/bash

alias bw::load::env="source $DOTFILES/shortcuts/bw/environments.sh load $1"
alias bw::dev="source $DOTFILES/shortcuts/bw/environments.sh load '3edccd43-4310-43bd-9c71-636352b999d3'"
alias bw::list="$DOTFILES/shortcuts/bw/environments.sh list"
alias bw::clear="$DOTFILES/shortcuts/bw/environments.sh clear"
alias bw::down="$DOTFILES/shortcuts/bw/environments.sh download $1"
