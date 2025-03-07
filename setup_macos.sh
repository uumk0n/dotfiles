#!/bin/bash

brew install bat yazi postgresql fzf tree npm fd nvim tmux lazygit ripgrep

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

cp -r ./nvim/* ~/.config/nvim/

mkdir ~/.config/ghostty/
cp -r ./ghostty/* ~/.config/ghostty/

cp .tmux.conf ~/

brew install --cask docker
brew install --cask ghostty
brew install --cask firefox
brew install --cask keycastr

echo "Скрипт выполнен успешно!"
