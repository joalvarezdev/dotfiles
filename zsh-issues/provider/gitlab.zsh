#!/usr/bin/env zsh

function issues::list {
  glab issue list
}

function issues::task::create {
  local task
  task=${1}
  glab issue create --title "${task}"
}

function issues::task::chore {
    local task
    task="chore: ${1}"
    glab issue create --title "${task}" \
        --assignee @me \
        --label "status/backlog" \
        --label "kind/chore" \
        --label "priority/medium" \
}
