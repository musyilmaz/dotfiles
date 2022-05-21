#!/bin/bash

echo "Setting up dotfiles"

if [ "$(uname)" == "Darwin" ]; then
	echo "Running on Mac OS"

	echo ">> HOMEBREW"
	source brew/brew.sh
else
	echo "Currently not configured for this system"
	exit 0
fi
