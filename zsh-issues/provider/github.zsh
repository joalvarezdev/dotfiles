#!/usr/bin/env zsh

function issues::list {
  gh issue list
}

function issues::task::create {
  local task
  task=${1}
  gh issue create --title "${task}"
}
