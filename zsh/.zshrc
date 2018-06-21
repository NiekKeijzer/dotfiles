POFILE_STARTUP=false
# Start profiling
if [[ "$PROFILE_STARTUP" == true ]]; then
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%M%S%.} %N:%i> '
    exec 3>&2 2>$HOME/tmp/startlog.$$
    setopt xtrace prompt_subst
fi

# Load configuration files
for config (~/.zsh/*.zsh) source $config

# Syntax highlighting
if [[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -f $HOME/.zsh/ssh-agent.sh ]]; then
  source $HOME/.zsh/ssh-agent.sh >/dev/null
fi

# Add all keys in keychain to agent
ssh-add -A &> /dev/null

# Stop profiling
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi

# added by travis gem
[ -f /Users/niekkeijzer/.travis/travis.sh ] && source /Users/niekkeijzer/.travis/travis.sh
