#!/bin/bash


brew install postgresql fzf tree npm fd nvim tmux lazygit ripgrep

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

cp -r ./nvim/* ~/.config/nvim/

cp .tmux.conf ~/

brew install docker --cask

echo "Скрипт выполнен успешно!"
