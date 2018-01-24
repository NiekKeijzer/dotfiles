# Modified version of Xero's version
# See: https://github.com/xero/dotfiles/blob/master/zsh/.zsh/prompt.zsh
ICO_DIRTY="*"
ICO_AHEAD="↑"
ICO_BEHIND="↓"
ICO_DIVERGED="⥮"
COLOR_ROOT="%F{red}"
COLOR_USER="%F{cyan}"
COLOR_NORMAL="%F{white}"
PROMPT_STYLE="dual"

setopt PROMPT_SUBST
autoload -Uz colors && colors

if [[ "$EUID" -ne "0" ]]
then  # if user is not root
	USER_LEVEL="${COLOR_USER}"
else # root!
	USER_LEVEL="${COLOR_ROOT}"
fi

#█▓▒░ git prompt
GIT_PROMPT() {
	# TODO: Check if branch has remote

  test=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ ! "$test" ]; then
		# Return directly if we're not in a git directory
    return
  fi

  ref=$(git branch | sed -n '/\* /s///p' 2> /dev/null)
  dirty="" && [[ $(git status | grep "Untracked") ]] && dirty=$ICO_DIRTY
  remote=$(git rev-parse --symbolic-full-name --abbrev-ref @{u} 2> /dev/null)
  stat=$(git status | sed -n 2p)
  case "$stat" in
    *ahead*)
      stat=$ICO_AHEAD
    ;;
    *behind*)
      stat=$ICO_BEHIND
    ;;
    *diverged*)
      stat=$ICO_DIVERGED
    ;;
    *)
      stat=""
    ;;
  esac

  echo "${USER_LEVEL}╶╴${COLOR_NORMAL}"${ref}${dirty}${stat}"${USER_LEVEL}╺─╸"
}
PROMPT='${USER_LEVEL}┌╸${COLOR_NORMAL}%~${USER_LEVEL}$(GIT_PROMPT)
${USER_LEVEL}└─╸ %f'
