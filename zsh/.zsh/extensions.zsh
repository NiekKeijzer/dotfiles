function load_async () {
    source ~/Projects/dotfiles/zsh/.zsh/extensions/zsh-async/async.zsh

    async_init
}

load_async

# fpath=(~/Projects/dotfiles/zsh/.zsh/extensions/zsh-async/async.zsh $fpath)
# autoload -Uz async && async
