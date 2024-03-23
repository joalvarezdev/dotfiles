
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
  zsh-docker-aliases
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# *************************************************

source $HOME/dotfiles/zsh_config/generals.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

if [[ ! -f /tmp/ssh.txt ]]; then
  eval $(ssh-agent) &> /dev/null
  echo "export SSH_AUTH_SOCK="$SSH_AUTH_SOCK > /tmp/ssh.txt
fi

source /tmp/ssh.txt

# Load Angular CLI autocompletion.
source <(ng completion script)

source ~/.oh-my-zsh/plugins/emoji-in-the-shell/emoji-in-the-shell.zsh
