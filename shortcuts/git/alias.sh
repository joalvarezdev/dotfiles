#!/bin/bash

alias gp="git push"
alias gpf="git push --force origin $(git branch --show-current)"
alias gpsup="git push --set-upstream origin $(git branch --show-current)"
alias gcmsg="git commit -m"
alias gsts="git stash push -m"
alias gstsu="git stash push -u -m"
alias gstl="git stash list"

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "🚧 --wip-- [skip ci]"'
# alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gunwip='git log -n1 | grep -q "\-\-wip\-\-" && git reset HEAD~1'
alias gsts='git stash -- $(git diff --staged --name-only)'

gmove() {
  git stash -- $(git diff --staged --name-only) &&
    gwip
  git branch $1 $2 &&
    git checkout $1 &&
    git stash pop
}
