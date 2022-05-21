#
# Makefile for dotfiles
#
# 
help:
	@echo "Makefile for dotfiles                                         "
	@echo "                                                              "
	@echo "Usage:                                                        "
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

install_zsh: uninstall_zsh
	RUNZSH="no" sh `pwd`/zsh/install.sh
	mkdir ~/.zshscripts
	ln -sF `pwd`/zsh/zsh_aliases ~/.zshscripts/.aliases
	ln -sf `pwd`/zsh/zshrc	~/.zshrc
	zsh

uninstall_zsh:
	rm -rf ~/.zshrc
	rm -rf ~/.oh-my-zsh
	rm -rf ~/.zshscripts

install_tmux: uninstall_tmux
	ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf

uninstall_tmux:
	rm -rf ~/.tmux.conf
