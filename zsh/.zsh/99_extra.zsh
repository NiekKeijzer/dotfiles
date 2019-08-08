# Check if an `extra` file exists and load it
extra_files=("$HOME/.extra.zsh" "$HOME/.extra")

for extra in $extra_files; do
  if [ -f $extra ]; then
    source $extra
  fi
done

# Check if Git user file exists
if [[ ! -f "$HOME/.git_user" ]]; then
  echo "~/.git_user not found, create it to tell Git who you are"
fi
