# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:$HOME/.cargo/bin"
export LESS="-FRSXi"
export FZF_BASE="$HOME/.fzf"
export EDITOR="emacs"

if [[ $+commands[sccache] ]]; then
    export RUSTC_WRAPPER=$(which sccache)
fi

setopt hist_ignore_all_dups

ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir root_indicator vcs)
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

ZSH_TMUX_AUTOSTART=true

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    gitfast
    bgnotify
    wd
    colored-man-pages
    fzf
    tmux
    cargo
    extract
    helm
)

source $ZSH/oh-my-zsh.sh

alias gs='git status'
alias gd='git diff'
alias gau='git add -u'
alias gc='git commit'
alias ga='git commit --amend'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
