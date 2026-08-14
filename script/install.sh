#!/usr/bin/env bash

target="$HOME/seesee010-dotfiles"

if ! command -v git &>/dev/null; then
	echo 'no git installed yet, please do that before running this script again!'
	exit 1
fi

mkdir -p "$target"
cd "$target" || exit

git clone https://github.com/seesee010/dotfiles "$target/dotfiles" || exit

shopt -s dotglob
cp -r "$target"/dotfiles/* "$HOME"

echo 'Done!'
