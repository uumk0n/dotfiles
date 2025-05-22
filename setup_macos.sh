#!/bin/bash

#Tools
brew install bat yazi postgresql fzf tree npm fd nvim tmux lazygit ripgrep

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

# configs
cp -r ./nvim/* ~/.config/nvim/

mkdir ~/.config/ghostty/
mkdir ~/.config/yazi/
mkdir ~/.config/sketchybar/
mkdir ~/.config/karabiner/

cp -r ./ghostty/* ~/.config/ghostty/
cp -r ./yazi/* ~/.config/yazi/
cp -r ./sketchybar/* ~/.config/sketchybar/
cp -r ./karabiner/* ~/.config/karabiner/

cp .tmux.conf ~/
cp .aerospace.toml

# Apps
brew install --cask docker
brew install --cask ghostty
brew install --cask obsidian
brew install --cask hot
brew install --cask zen

# sketchybar
brew tap FelixKratz/formulae
brew install sketchybar
brew install --cask font-hack-nerd-font
brew services start sketchybar

#aerospace
brew install --cask nikitabobko/tap/aerospace

echo "Скрипт выполнен успешно!"
