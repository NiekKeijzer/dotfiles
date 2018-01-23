#!/bin/zsh

function branches() {
  # List Git branches
  for branch in $(git branch | sed s/^..//); do
    time_ago=$(git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $branch --);
    printf "%-53s - %s %s\n" $time_ago $branch $tracks_upstream;
  done | sort;
}

function load_keys() {
  # Load SSH keys in ~/.ssh/
  for file in ~/.ssh/*; do
    if [[ -f "$file.pub" ]]; then
      ssh-add -K $1
    fi
  done
}
