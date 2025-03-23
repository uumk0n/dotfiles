# Зависимости для MacOS

## Fish terminal shell

```bash
brew install fish # or other way 
chsh -s $(which fish)
echo $(which fish) | sudo tee -a /etc/shells
```

## Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval (/opt/homebrew/bin/brew shellenv)' >>/Users/{user}/.config/fish/config.fish

eval $(/opt/homebrew/bin/brew shellenv)

```
