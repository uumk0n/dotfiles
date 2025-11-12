#!/bin/bash

#Tools
brew install bat postgresql fzf tree npm fd nvim tmux lazygit ripgrep

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

# configs
cp -r ./nvim/* ~/.config/nvim/

mkdir ~/.config/ghostty/

cp -r ./ghostty/* ~/.config/ghostty/

cp .tmux.conf ~/

# Apps
brew install --cask docker
brew install --cask ghostty
brew install --cask obsidian
brew install --cask hot

echo "Скрипт выполнен успешно!"
