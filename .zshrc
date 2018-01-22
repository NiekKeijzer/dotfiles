#!/bin/bash 

local debug=false
if [[ $debug == true ]]; then
    zmodload zsh/zprof
fi

# ====================================
# Exports
# ====================================

export ZSH=/Users/niekkeijzer/.oh-my-zsh

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export GOPATH="/Users/niekkeijzer/go/"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# ====================================
# User configuration
# ====================================

ZSH_THEME=""
plugins=(osx capistrano git git-flow git_remote_branch git-extras docker forklift celery redis-cli python pep8 autopep8 composer zsh-syntax-highlighting)

fpath=( "$HOME/.zfunctions" $fpath )

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

# ====================================
# Functions
# ====================================

if [ -f ~/.zsh_functions ]; then
    source ~/.zsh_functions
fi

# ====================================
# Aliases
# ====================================

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

eval $(thefuck --alias fuck)

# ====================================
# Applications
# ====================================

ssh-agent &> /dev/null
ssh-add -A &> /dev/null

if [[ $debug == true ]]; then
    zprof
fi
