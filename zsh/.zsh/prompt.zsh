# Config values
ICON_UNCOMMITED="*"
ICON_AHEAD="↑"
ICON_BEHIND="↓"
COLOR_NORMAL="%F{white}"

if [[ $(id -u 2> /dev/null) = "0" ]]; then
  # Use different line color for root user
  USER_COLOR="%F{red}"
else
  USER_COLOR="%F{blue}"
fi

setopt PROMPT_SUBST
autoload -Uz colors && colors

function git_prompt() {
  is_git=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ ! ${is_git} ]; then
    # Don't include a Git prompt if we're not in a Git directory
    return
  fi

  branch=$(git branch | grep \* | cut -d ' ' -f2  2> /dev/null)
  prompt="${USER_COLOR}╶╴${COLOR_NORMAL}${branch}"

  uncommited=$(git status --porcelain | wc -l 2> /dev/null)
  if [ ${uncommited} -gt "0" ]; then
    prompt="${prompt}${ICO_UNCOMMITED}"
  fi

  git_status=$(git status | sed -n 2p 2> /dev/null)
  case ${git_status} in
    *ahead*)
      stat=${ICON_AHEAD}
    ;;
    *behind*)
      stat=${ICON_BEHIND}
    ;;
    *diverged*)
      stat=${ICON_DIVERGED}
    ;;
    *)
      stat=""
    ;;
  esac

  echo "${prompt}${stat}"
}

function trailing() {
  # Determine if the trailing line thingy should be displayed
  is_git=$(git rev-parse --is-inside-work-tree 2> /dev/null)

  if [ \( "${is_git}" \) ]; then
    echo "${USER_COLOR}╺─"
  fi
}

PROMPT='${USER_COLOR}┌╸${COLOR_NORMAL}%~$(trailing)
${USER_COLOR}└─╸ %f'
