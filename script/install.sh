#!/usr/bin/env bash

target="$HOME/seesee010-dotfiles"
clone='https://github.com/seesee010/dotfiles'
keydpath='/etc/keyd/default.conf'

if ! command -v git &>/dev/null; then
	echo 'no git installed yet, please do that before running this script again!'
	exit 1
fi

mkdir -p "$target"
if ! cd "$target"; then
	echo "Error while cd into: $target"
	exit 1
fi

# Clone "$clone" or pull "$target/dotfiles"
if [[ ! -d "$target/dotfiles" ]]; then
	if ! git clone "$clone"; then
		echo "Error while cloning $clone"
		exit 1
	fi
else
	if ! cd "$target/dotfiles"; then
		echo "Error while cd into: $target/dotfiles"
		exit 1
	fi
	if ! git pull; then
		echo "Error while pulling $clone"
		exit 1
	fi
fi

shopt -s dotglob
cp -r "$target"/dotfiles/* "$HOME"

# Symlink
sudo mkdir -p /etc/keyd
if [[ ! -L "$keydpath" ]]; then
	sudo ln -s "$HOME/.config/keyboard/default.conf" "$keydpath"
else
	echo "Symlink already exists: $keydpath"
fi

echo 'Done!'
