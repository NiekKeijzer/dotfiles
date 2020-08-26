export ZPLUG_HOME=$HOME/.zplug

if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source "$ZPLUG_HOME/init.zsh"

# Oh my ZSH core 
zplug "lib/completion", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/functions", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh

# Oh my ZSH plugins 
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/django", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/dotenv", from:oh-my-zsh
zplug "plugins/jsontools", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-auto-fetch", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh

# ZSH users
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# Custom / Github plugins
zplug "mafredri/zsh-async", from:"github", defer:0

# Theme 
zplug "romkatv/powerlevel10k", as:theme, depth:1

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load