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
  git_prompt="${USER_COLOR}╶╴${COLOR_NORMAL}${branch}"

  uncommited=$(git status --porcelain | wc -l 2> /dev/null)
  if [ ${uncommited} -gt "0" ]; then
    git_prompt="${git_prompt}${ICO_UNCOMMITED}"
  fi

  git_status=$(git status | sed -n 2p 2> /dev/null)
  case ${git_status} in
    *ahead*)
      git_stat=${ICON_AHEAD}
    ;;
    *behind*)
      git_stat=${ICON_BEHIND}
    ;;
    *diverged*)
      git_stat=${ICON_DIVERGED}
    ;;
    *)
      git_stat=""
    ;;
  esac

  echo "$git_prompt$git_stat"
}

function trailing() {
  # Determine if the trailing line thingy should be displayed
  is_git=$(git rev-parse --is-inside-work-tree 2> /dev/null)

  if [ \( "${is_git}" \) ]; then
    echo "${USER_COLOR}╺─"
  fi
}

function update_prompt() {
    if [[ ! $3 =~ '[+-]?([0-9]*[.])?[0-9]+' ]]; then
        export PROMPT="${PROMPT/\$\(: __git__\)/$3}"
        print $@
    fi
#    async_job git git_prompt
}

# async_start_worker git -n
# async_register_callback git update_prompt
# async_job git git_prompt 

PROMPT='${USER_COLOR}┌╸${COLOR_NORMAL}%~${USER_COLOR}$(: __git__)${USER_COLOR}╺─
${USER_COLOR}└─╸ %f'
