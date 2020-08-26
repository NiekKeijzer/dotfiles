if command -v pyenv >/dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if command -v fuck >/dev/null; then 
  eval $(fuck () { TF_PYTHONIOENCODING=$PYTHONIOENCODING; export TF_SHELL=zsh; export TF_ALIAS=fuck; TF_SHELL_ALIASES=$(alias); export TF_SHELL_ALIASES; TF_HISTORY="$(fc -ln -10)"; export TF_HISTORY; export PYTHONIOENCODING=utf-8; TF_CMD=$( thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@ ) && eval $TF_CMD; unset TF_HISTORY; export PYTHONIOENCODING=$TF_PYTHONIOENCODING; test -n "$TF_CMD" && print -s $TF_CMD })
fi

export NVM_DIR="$HOME/.nvm"
if [ -f "$NVM_DIR/nvm.sh" ]; then 
  # Load NVM async as it add an insane amount of overhead 
  function load_nvm() {
      [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  }

  async_start_worker nvm_worker -n
  async_register_callback nvm_worker load_nvm
  async_job nvm_worker sleep 0.1
fi 
