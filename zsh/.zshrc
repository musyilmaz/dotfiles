export ZSH=$HOME/.oh-my-zsh
export ZSH_PLUGINS=$ZSH/custom/plugins
export ZSH_SCRIPTS=$HOME/.zshscripts
export EDITOR="vim"

ZSH_THEME="robbyrussell"
plugins=(git brew colorize common-aliases zsh-interactive-cd)
source $ZSH/oh-my-zsh.sh

# ---- ALIAS ----
# Config
alias zcfg="vim ~/.zshrc"
alias zrld="source ~/.zshrc"
alias vim="nvim"
alias nvim="NVIM_APPNAME=lazyvim nvim"
alias python="python3"
alias nvim-kickstart="NVIM_APPNAME=kickstart nvim"
alias nvim-base-nvim="NVIM_APPNAME=base-nvim nvim"
alias nvim-lazyvim="NVIM_APPNAME=lazyvim nvim"

# Path Shortcuts
alias dev="cd /Users/musyilmaz/Documents/development/"
alias playground="cd /Users/musyilmaz/Documents/development/playground/"
alias urbint="cd /Users/musyilmaz/Documents/development/toptal/urbint/"
alias dotfiles="cd /Users/musyilmaz/Documents/development/dotfiles/"
alias musyilmaz="cd /Users/musyilmaz/Documents/development/musyilmaz.dev/"

PATH="/usr/local/bin:$PATH"
PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"


function nvims() {
  items=("default" "lazyvim" "base-nvim" "kickstart" )
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Neovim Config >> " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
	  echo "Nothing Selected"
	  return 0
  elif [[ $config == "default" ]]; then
	  config="lazyvim"
  fi
  NVIM_APPNAME=$config nvim $@
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

export PNPM_HOME="/Users/musyilmaz/Library/pnpm"
export PATH="$PNPM_HOME:$PATH":

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
