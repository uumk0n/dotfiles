#!/bin/bash

sudo dnf update -y
sudo dnf install -y npm fd-find bat httpie neovim tmux lazygit mysql ripgrep git fish

if ! grep -q "/usr/bin/fish" /etc/shells; then
  echo "/usr/bin/fish" | sudo tee -a /etc/shells
fi

chsh -s /usr/bin/fish

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

cp -r ./nvim/* ~/.config/nvim/

cp .tmux.conf ~/

echo "Скрипт выполнен успешно!"
