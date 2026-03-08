#!/bin/bash

alias bw::dw="source $DOTFILES/shortcuts/bw/environments.sh load $1"

alias bw::list="$DOTFILES/shortcuts/bw/environments.sh list"
alias bw::clear="$DOTFILES/shortcuts/bw/environments.sh clear"
alias bw::down="$DOTFILES/shortcuts/bw/environments.sh download $1"

alias bw::dir="bw list folders | jq -C '.'"
function bw::dir::ls() {
  bw list items --folderid "$1" | jq -C '.'
}

# work

alias bw::infs::dev="source $DOTFILES/shortcuts/bw/environments.sh load 'ff6f080d-36ef-415a-9fa3-b40601747657'"
alias bw::infs::srv="source $DOTFILES/shortcuts/bw/environments.sh load 'c654a970-799e-4a43-97a2-b406017a6a40'"
