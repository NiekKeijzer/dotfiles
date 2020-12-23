# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH_CUSTOM=$HOME/.zsh-custom

# Load plugin manager
export ZINIT_FILE=$ZSH_CUSTOM/plugins/zinit/zinit.zsh;
if [[ -f "$ZINIT_FILE" ]]; then
  source "$ZINIT_FILE";
fi

# Load user config
for config ($ZSH_CUSTOM/user/*.zsh) source $config
# source "$ZSH_CUSTOM/user/11_zinit.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
