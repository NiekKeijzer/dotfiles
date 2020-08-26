maybe_defer () {
  if command -v zsh-defer >/dev/null; then
    zsh-defer eval $@
  else
    eval $@
  fi
}