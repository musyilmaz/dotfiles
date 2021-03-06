#
# Makefile for dotfiles
#
# 
help:
	@echo "Makefile for dotfiles                                         "
	@echo "                                                              "
	@echo "Usage:                                                        "
	@echo "    make install                 	Installs everything  "
	@echo "    make install_{TARGET}                Installs the TARGET  "
	@echo "    make uninstall_{TARGET}              Installs the TARGET  "
	@echo "                                                              "
	@echo "Targets:                                                      "
	@echo "   zsh                                   Installs ZSH Configs "
	@echo "   tmux                                  Installs TMUX Configs"
	@echo "                                                              "
	@echo "All install commands are also available as uninstall commands "
	@echo "to remove installed contents                                  "
	@echo "                                                              "

install: uninstall_zsh uninstall_tmux
	sh `pwd`/install.sh
	make install_zsh
	make install_tmux
	make install_nvim

install_zsh: uninstall_zsh
	RUNZSH="no" sh `pwd`/zsh/install.sh
	mkdir ~/.zshscripts
	ln -sF `pwd`/zsh/zsh_aliases ~/.zshscripts/.aliases
	ln -sf `pwd`/zsh/zshrc	~/.zshrc
	@echo ">>>> Run zsh to initiate shell"

uninstall_zsh:
	rm -rf ~/.zshrc
	rm -rf ~/.oh-my-zsh
	rm -rf ~/.zshscripts

install_tmux: uninstall_tmux
	ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf

uninstall_tmux:
	rm -rf ~/.tmux.conf

install_nvim: uninstall_nvim
	ln -sf `pwd`/nvim ~/.config/nvim
	@echo ">>>> Run vim & PackerInstall to install packages"

uninstall_nvim:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
