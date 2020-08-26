maybe_defer () {
  if command -v zsh-defer >/dev/null; then
    zsh-defer eval $@
  else
    eval $@
  fi
}

if command -v async_init >/dev/null; then
  async_init
  async_start_worker global_worker -n
fi 

maybe_async () {
  if command -v async_job >/dev/null; then 
    async_job global_worker eval $@
  else
    eval $@
  fi 
}