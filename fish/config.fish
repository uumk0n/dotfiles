set fish_greeting ""

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

eval (/opt/homebrew/bin/brew shellenv)

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

alias t tmux
alias n nvim
alias q "cd && clear && exit"
alias ll "ls -l"
alias g git
alias gst "git status"
alias c claude

set -gx EDITOR nvim

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set -gx LDFLAGS -L/opt/homebrew/opt/ruby/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/ruby/include
