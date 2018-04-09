# ====================================
# Basics
# ====================================

alias vi="vim"
alias ls="ls -la -G"
alias mk="mkdir"
alias t="touch"
alias x="exit"
alias o="open ."
alias x+="chmod +x"
alias f="find . -name \"$1\" @>&1 | grep -v 'Permission denied'"

alias reload="source ~/.zshrc"
alias sys_update="brew update; sudo softwareupdae -ir"
alias bye="sudo shutdown -h now"
alias cya="sudo shutdown -r now"

alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias clean_ds="find . -name '*.DS_Store' -type f -ls -delete"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Shouldn't be necessary if PYTHONDONTWRITEBYTECODE is set to `True`
alias pyclean="find . -name '*.pyc' -name '__pycache__' | xargs -I {} rm -v '{}'"

# Pretty cat
alias c="pygmentize -O style=borland -f console256 -g"

# ====================================
# Apps 'n' Stuff
# ====================================

alias kubeui="kubectl proxy --port=8800 & newtab http://localhost:8800/ui"
alias publicip="curl https://api.ipify.org"
alias localip="ipconfig getifaddr en0"
alias weather="curl -4 http://wttr.in"

if command -v thefuck >/dev/null; then
  alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD ; test -n "$TF_CMD" && print -s $TF_CMD'
fi

if command -v pyenv >/dev/null; then
  # Configure PyEnv
  eval "$(pyenv init -)"

  if command -v pyenv-virtualenv-init >/dev/null; then
    # Optionally configure PyEnv virutalenv as well
    eval "$(pyenv virtualenv-init -)";
  fi
fi
