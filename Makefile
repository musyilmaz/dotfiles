#
# Makefile for dotfiles
#
# 
help:
	@echo "Makefile for dotfiles                                         "
	@echo "                                                              "
	@echo "Usage:                                                        "
	@echo "    make install                 				Installs everything  "
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

install_nvim: uninstall_nvim
	ln -sf `pwd`/nvim ~/.config/nvim
	@echo ">>>> Run vim & PackerInstall to install packages"

uninstall_nvim:
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
