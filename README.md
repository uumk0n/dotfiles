# Зависимости для MacOS

## Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval (/opt/homebrew/bin/brew shellenv)' >>/Users/ilakonaev/.config/fish/config.fish

eval $(/opt/homebrew/bin/brew shellenv)

```

## Fish terminal shell

```bash
brew install fish
chsh -s $(which fish)
echo $(which fish) | sudo tee -a /etc/shells
```
