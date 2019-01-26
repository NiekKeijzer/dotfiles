fpath=(~/.zsh $fpath)

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export GOPATH="$HOME/go/"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/Library/Python/3.6/bin:$PATH"

export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if command -v pyenv >/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi
