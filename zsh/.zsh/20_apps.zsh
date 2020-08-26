if command -v direnv >/dev/null; then 
  eval "$(direnv hook zsh)"
fi

if command -v pyenv >/dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
