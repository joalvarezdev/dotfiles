#!/usr/bin/env zsh

function zsh-issues::internal::info {
  git ls-remote --get-url 2> /dev/null
}

function zsh-issues::internal::provider {
    local provider_name
    current_provider=$(zsh-issues::internal::info)
    provider_name="github"
    if [[ "$current_provider" =~ "github" ]]; then
        provider_name="github"
    elif [[ "$current_provider" =~ "gitlab" ]]; then
        provider_name="gitlab"
    elif [[ "$current_provider" =~ "bitbucket" ]]; then
        provider_name="bitbucket"
    fi
    echo "${provider_name}"
}
