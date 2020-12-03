# Dotfiles

Might not work for you, but works for me.

## Downloading

This repository relies on Git submodules, make sure you clone this repo with

```
git clone --recursive https://github.com/NiekKeijzer/dotfiles.git
```

To update the submodules run

```
git submodule update
```

## Installation

Run the following commands to finish setting up

```
vim -c :PlugInstall
```

Alternatively use my [Ansible Mac Setup repo](https://gitlab.com/NiekKeijzer/mac_setup)
 to automate the entire process.

## Usage

Make sure you have stow installed

```
brew install stow
```

Select the dotfiles you'd like to install and run the following for each of them

```
stow -t ~ vim
```
Note: The -t ~ may not be necessary in most cases, but ensures the files are
 placed in the homedir.

### Custom configuration

If either `.extra` or `.extra.zsh` exists in the user's homedir, it's loaded
 during the final step of initialization. This can be used to overwrite the
 Git committer for example.
