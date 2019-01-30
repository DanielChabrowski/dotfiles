# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir root_indicator vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=""

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(
  zsh-autosuggestions
  git
)

source $ZSH/oh-my-zsh.sh

alias gs='git status'
alias gd='git diff'
alias gau='git add -u'
alias gc='git commit'
alias ga='git commit --amend'
