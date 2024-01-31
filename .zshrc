HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

unsetopt beep # No beeps
bindkey -e # Vim style

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# Autoload ZPM
if [[ ! -f ~/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
fi
source ~/.zpm/zpm.zsh

# Plugins

zpm load @gh/spaceship-prompt/spaceship-prompt
zpm load @gh/spaceship-prompt/spaceship-vi-mode

# Theme

source ~/.zpm/plugins/@gh---spaceship-prompt---spaceship-prompt/spaceship.zsh

SPACESHIP_HOST_SHOW=always
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_DIR_TRUNC_REPO=false

# Aliases

vim#() {
    local vimrcFile="$HOME/.vimrc"
    sudo vim -u $vimrcFile $1
}

alias sudo='sudo '
alias scb=clip.exe
alias sctl=systemctl
alias jctl=journalctl
alias rg=ranger
