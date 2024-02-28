#!/bin/bash

branches_to_keep=("$@")

for branch in $(git branch | cut -c 3-); do
  if [[ ! "${branches_to_keep[@]}" =~ "$branch" ]]; then
    git branch -D $branch
  fi
done

