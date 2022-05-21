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

install_tmux: uninstall_tmux
	[ -d ~/.local/bin/tmux-powerline ] || mkdir -p ~/.local/bin/tmux-powerline && cd ~/.local/bin/tmux-powerline && git clone https://github.com/erikw/tmux-powerline.git .
	[ -d ~/.local/bin/tmux-powerline ] && cd ~/.local/bin/tmux-powerline && git pull
	ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf

uninstall_tmux:
	rm -rf ~/.tmux.conf
