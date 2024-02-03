
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  fast-syntax-highlighting
  oh-my-matrix
  poetry
)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# BITWARDEN
if [[ ! -f /tmp/env_dep.txt ]]; then
  export BW_SESSION=$(bw unlock $(secret-tool lookup bitwarden export_const) --raw)
  bw sync
  bw get notes environments > /tmp/env_dep.txt
  bw get notes infosis > /tmp/env_infs.txt
fi

source /tmp/env_infs.txt
source /tmp/env_dep.txt

# *************************************************

source $DOTFILES/zsh_config/generals.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

if [[ ! -f /tmp/ssh.txt ]]; then
  eval $(ssh-agent) &> /dev/null
  echo "export SSH_AUTH_SOCK="$SSH_AUTH_SOCK > /tmp/ssh.txt
fi

source /tmp/ssh.txt

export PATH=/home/joalvarez/.cache/pypoetry/virtualenvs/sign-up-quick--ev9ptuw-py3.11/bin:$PATH
