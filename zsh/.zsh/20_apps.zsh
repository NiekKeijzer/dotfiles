if command -v pyenv >/dev/null; then
  maybe_async eval "$(pyenv init -)"
  maybe_async eval "$(pyenv virtualenv-init -)"
fi

if command -v fuck >/dev/null; then 
  maybe_async eval $(fuck () { TF_PYTHONIOENCODING=$PYTHONIOENCODING; export TF_SHELL=zsh; export TF_ALIAS=fuck; TF_SHELL_ALIASES=$(alias); export TF_SHELL_ALIASES; TF_HISTORY="$(fc -ln -10)"; export TF_HISTORY; export PYTHONIOENCODING=utf-8; TF_CMD=$( thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@ ) && eval $TF_CMD; unset TF_HISTORY; export PYTHONIOENCODING=$TF_PYTHONIOENCODING; test -n "$TF_CMD" && print -s $TF_CMD })
fi

export NVM_DIR="$HOME/.nvm"
if [ -f "$NVM_DIR/nvm.sh" ]; then 
  maybe_async source "$NVM_DIR/nvm.sh"  # This loads nvm
  maybe_async source "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi  
