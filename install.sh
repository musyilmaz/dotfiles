#!/bin/bash

echo "Setting up dotfiles"

if [ "$(uname)" == "Darwin" ]; then
	echo "Running on Mac OS"
	
	read -p "Do you want to install brew and cask dependencies (recommended for clean setups): y/n/cancel" CONDITION;

	if [ "$CONDITION" == "y" ]; then
		echo ">> HOMEBREW"
		source brew/brew.sh

		echo ">> HOMEBREW CASK"
		source brew/cask.sh
	fi
else
	echo "Currently not configured for this system"
	exit 0
fi
