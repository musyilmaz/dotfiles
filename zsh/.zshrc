# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

skip_global_compinit=1

# --- Exports
export ZSH=$HOME/.oh-my-zsh
export ZSH_PLUGINS=$ZSH/custom/plugins
export ZSH_SCRIPTS=$HOME/.zshscripts
export EDITOR='vim'
export ZK_NOTEBOOK_DIR=$HOME/Documents/Development/journal

# --- Themes
# PowerLevel10k | https://github.com/romkatv/powerlevel10k

ZSH_THEME="powerlevel10k/powerlevel10k"

# --- Plugins
# git
# tmux
# zsh-autocomplete | https://github.com/marlonrichert/zsh-autocomplete
# fast-syntax-highlighting | https://github.com/zdharma-continuum/fast-syntax-highlighting
# zsh-autosuggestions | https://github.com/zsh-users/zsh-autosuggestions

plugins=(git tmux)

ZSH_TMUX_AUTOSTART=false


source $ZSH_SCRIPTS/.aliases
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"
