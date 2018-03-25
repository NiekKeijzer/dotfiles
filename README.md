# Dotfiles

Might not be useful to anyone, but configures my machines exactly
 the way I like it.

## Usage

Make sure you have `stow` installed

```bash
brew install stow
```

Select the dotfiles you'd like to install and run the following for each of them

```bash
stow -t ~ vim
```

_Note:_ The `-t ~` may not be necessary in most cases, but ensures the files are placed in the homedir. 
