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
alias python="python3"

# Path Shortcuts
alias cf="cd /Users/musyilmaz/Documents/development/toptal/seeeff/cf-server/"
alias dot="cd /Users/musyilmaz/Documents/development/dot/"
alias dotfiles="cd /Users/musyilmaz/Documents/development/dotfiles/"
alias musyilmaz="cd /Users/musyilmaz/Documents/development/musyilmaz.dev/"
alias sd="cd /Users/musyilmaz/Documents/development/stable_diffusion/"

PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

export PNPM_HOME="/Users/musyilmaz/Library/pnpm"
export PATH="$PNPM_HOME:$PATH":

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


