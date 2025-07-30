#!/bin/bash

alias k="kubectl"
alias kc="kconf"

alias k::apl="k apply -k"
alias k::del="k delete -k"
alias k::res="k rollout restart"
alias k::del::job="k delete job"

alias kd::new="kind create cluster --config"
alias kd::del="kind delete cluster --name"
