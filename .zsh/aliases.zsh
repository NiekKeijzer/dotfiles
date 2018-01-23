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

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias newtab='osascript ~/Scripts/newtab.scpt'
alias clean_ds="find . -name '*.DS_Store' -type f -ls -delete"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias myip="curl ipecho.net/plain"

# ====================================
# Apps 'n' Stuff
# ====================================

alias kubeui="kubectl proxy --port=8800 & newtab http://localhost:8800/ui"

if command -v thefuck >/dev/null; then
  alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD ; test -n "$TF_CMD" && print -s $TF_CMD'
fi
