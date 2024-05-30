#!/bin/bash

# Установить Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Добавить Homebrew в среду fish
echo 'eval (/opt/homebrew/bin/brew shellenv)' >>/Users/ilakonaev/.config/fish/config.fish

# Выполнить команду для применения изменений
eval $(/opt/homebrew/bin/brew shellenv)

# Установить необходимые пакеты через Homebrew
brew install npm fd bat httpie nvim tmux lazygit mysql

# Клонировать плагин для tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Клонировать LazyVim starter конфигурацию
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Удалить .git в LazyVim starter конфигурации
rm -rf ~/.config/nvim/.git

# Заменить содержимое папки ~/.config/nvim на то, что лежит в репозитории в папке nvim
cp -r ./nvim/* ~/.config/nvim/

# Переместить файл .tmux.conf в домашнюю директорию
cp .tmux.conf ~/

echo "Скрипт выполнен успешно!"
