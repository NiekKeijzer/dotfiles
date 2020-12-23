export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'
export SHELL='/bin/zsh'
export BAT_THEME="Nord"
export TERM="screen-256color"

# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# GPG
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
