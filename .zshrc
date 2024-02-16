export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                               PLUGIN                                               #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    git
    zsh-history-substring-search
)

export ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                               ALIAS                                                #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#
alias ls='echo "ｌを使え！！！"'
alias gits='git status --short --branch'
alias df='duf'
alias pbcopy='xsel --clipboard --input'
alias cat='batcat --paging=never'
alias less='batcat'
alias l='exa --icons -al'
alias lg='\ls -a -1 | \rg'
alias src='source ~/.zshrc'
alias d='cd ~/Documents'
alias dot='vim ~/dotfiles'
alias C='code .'
alias sc-sh='maim ~/Pictures/$(date +%s).png'
alias grep='rg'
alias tree='tree -I .git -I node_modules'

function c(){
  cd "$(
    find ~  -maxdepth 7 \
    -type d -name node_modules -prune -o \
    -type d -name .git -prune -o \
    -type d -name .cache -prune -o \
    -type d -name _cacache -prune -o \
    -type d -name "*" -print  2>/dev/null |\
    fzf
  )"
}

function cr(){
  cd "$(
    find / -maxdepth 4 \
    -type d -name node_modules -prune -o \
    -type d -name .git -prune -o \
    -type d -name .cache -prune -o \
    -type d -name _cacache -prune -o \
    -type d -name "*" -print 2>/dev/null |\
    fzf
  )"
}

function c.(){
  cd "$(
    find . \
    -type d -name node_modules -prune -o \
    -type d -name .git -prune -o \
    -type d -name .cache -prune -o \
    -type d -name _cacache -prune -o \
    -type d -name "*" -print 2>/dev/null |\
    fzf
  )"
}

alias icat='kitty kitten icat'

function rand(){
  cat /dev/urandom | tr -dc 'a-z' | fold -w $1 | head -n 1
}

function mkcd() {
  mkdir $1 && cd $1 
}

function cd(){
  builtin cd $@ && l -l
}

#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                              KEYBIND                                               #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#
bindkey '^[OD' backward-kill-word
bindkey '^[OC' forward-word
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                                PATH                                                #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#
export PATH=$HOME/password/pub-bin:$PATH
export PATH=$HOME/.my-bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/kitty.app/bin:$PATH


#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                              HISTORY                                               #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt append_history
setopt share_history


#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                               OTHERS                                               #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

setopt no_beep

# kitty with ssh issue https://www.reddit.com/r/linux4noobs/comments/tkvs8o/kitty_terminal_with_ssh_issues/
export TERM=xterm-256color

# 乱用しすぎてるから一回使わないようにする
function scroll-and-clear-screen() { }
zle -N scroll-and-clear-screen
bindkey '^l' scroll-and-clear-screen

# dotfiles first
export LC_COLLATE="C"

export HISTORY_SUBSTRING_SEARCH_PREFIXED=not-empty

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export FZF_DEFAULT_OPTS="--reverse --height=20"
