#!/bin/bash

# Install Homebrew if it is not already installed
if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing Homebrew Dependencies"
brew install coreutils
brew install docker
brew install fd
brew install fzf
brew install git
brew install glow
brew install go
brew install mongodb
brew install neovim
brew install node
brew install nghttp2
brew install postgresql
brew install python
brew install python3
brew install tmux
brew install wget
brew install yarn
brew install zk
brew install zsh




# ==> Casks
#anydesk
#discord
#folx
#gimp
#iterm2
#keka
#kitty
#microsoft-remote-desktop
#postman
#spotify
#teamviewer
#visual-studio-code
#vlc
#zoom
