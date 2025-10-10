#!/usr/bin/env zsh

function zsh-issues::provider::factory {

  source "${ISSUES_PATH}/provider/base.zsh"

  source "${ISSUES_PATH}/provider/$(zsh-issues::internal::provider).zsh"

  source "${ISSUES_PATH}/provider/alias.zsh"
}

zsh-issues::provider::factory

