#!/usr/bin/env bash

target="$HOME/seesee010-dotfiles"
clone='https://github.com/seesee010/dotfiles'
keydpath='/etc/keyd/default.conf'

if ! command -v git &>/dev/null; then
	echo 'no git installed yet, please do that before running this script again!'
	exit 1
fi

if ! command -v rsync &>/dev/null; then
    echo 'rsync not installed, installing...'
    sudo pacman -S --noconfirm rsync
fi

mkdir -p "$target"
if ! cd "$target"; then
	echo "Error while cd into: $target"
	exit 1
fi

# Clone "$clone" or pull "$target/dotfiles"
if [[ ! -d "$target/dotfiles" ]]; then
	if ! git clone --recurse-submodules "$clone"; then
		echo "Error while cloning $clone"
		exit 1
	fi
else
	if ! cd "$target/dotfiles"; then
		echo "Error while cd into: $target/dotfiles"
		exit 1
	fi
	if ! git fetch origin; then
		echo "Error while fetching $clone"
		exit 1
	fi
	branch=$(git rev-parse --abbrev-ref HEAD)
	if ! git reset --hard "origin/$branch"; then
		echo "Error while resetting to origin/$branch"
		exit 1
	fi
	if ! git submodule update --init --recursive --force; then
		echo "Error while updating submodules"
		exit 1
	fi
fi

shopt -s dotglob
rsync -a --exclude='.git' "$target/dotfiles/" "$HOME/"

# Symlink
sudo mkdir -p /etc/keyd
if [[ ! -L "$keydpath" ]]; then
	sudo ln -s "$HOME/.config/keyboard/default.conf" "$keydpath"
else
	echo "Symlink already exists: $keydpath"
fi

echo 'Done!'
