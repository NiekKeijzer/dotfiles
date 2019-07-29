# Dotfiles

Might not work for you, but works for me.

## Usage

Make sure you have stow installed

```
brew install stow
```

Select the dotfiles you'd like to install and run the following for each of them

```
stow -t ~ vim
```
Note: The -t ~ may not be necessary in most cases, but ensures the files are placed in the homedir.
