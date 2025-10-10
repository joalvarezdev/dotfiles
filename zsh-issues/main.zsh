#!/usr/bin/env zsh

export GLAB_EDITOR=nvim
export GH_EDITOR=nvim

ISSUES_PATH=$(dirname "${0}")

source "${ISSUES_PATH}/internal/main.zsh"

source "${ISSUES_PATH}/provider/main.zsh"

