#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval (/opt/homebrew/bin/brew shellenv)' >>/Users/ilakonaev/.config/fish/config.fish

eval $(/opt/homebrew/bin/brew shellenv)

brew install postgresql fzf tree npm fd nvim tmux lazygit ripgrep

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

cp -r ./nvim/* ~/.config/nvim/

cp .tmux.conf ~/

brew install karabiner-elements --cask
brew install docker --cask

echo "Скрипт выполнен успешно!"
