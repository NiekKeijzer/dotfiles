alias flushdns="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias gentoken="openssl rand -hex 32"

if [ -f "$HOME/.dokku/contrib/dokku_client.sh" ]; then
  alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'
fi
