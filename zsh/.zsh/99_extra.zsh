# Check if an `extra` file exists and load it
extra_files=("$HOME/.extra.zsh" "$HOME/.extra")

for extra in $extra_files; do
  if [ -f $extra ]; then
    source $extra
  fi
done
