#!/usr/bin/bash

export INF="$GHQ_ROOT/gitlab.infosisglobal.com/"

alias infs=$INF

alias srv='lua $MY_GH/config_repository/server/connect_server.lua $1'
alias ssrv='lua $MY_GH/config_repository/server/show_server.lua $1'

alias zh=$INF/application_props

# Corremos un contenedor creado a partir de un archivo de configuración ubicado en el proyecto de api-server.
alias server='docker compose -f $INF/desarrollo/zwm-api-server/docker-compose.yml up -d &>/dev/null'
# Detenemos el contenedor que tenemos corriendo.
alias sserver='docker rm -f api-server &> /dev/null'

alias home='$INF/application_props'

alias infsk="k9s --kubeconfig='$HOME/.kube/infosisk8stesting.yaml'"
