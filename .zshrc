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

CD_HISTFILE="$HOME/.cache/cd_history_file.txt"
CD_HISTSIZE=100

function chpwd_add_cd_hist(){
	CUR_DIR="$(pwd)"	
	cd_history_manager add --histfile $CD_HISTFILE --histsize $CD_HISTSIZE -a $CUR_DIR
}
function print_cd_history(){
	cd_history_manager print --histfile $CD_HISTFILE
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd chpwd_add_cd_hist
#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                               ALIAS                                                #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#
alias gits='git status --short --branch'
alias lg='\ls -a -1 | \rg'
alias src='source ~/.zshrc'
alias d='cd ~/Documents'
alias dot='code ~/dotfiles'
alias C='code .'
alias sc-sh='maim ~/Pictures/screen-shot/$(date "+%Y-%m-%d_%H-%M-%S").png'
alias brew_update='brew upgrade --cask --greedy && brew update && brew upgrade && brew cleanup'

#
# vim => nvim
#
if type "vi" >/dev/null 2>&1; then
	alias v='vi'
fi
if type "vim" >/dev/null 2>&1; then
	alias v='vim'
fi
if type "nvim" >/dev/null 2>&1; then
	alias v='nvim'
else
	echo "\"nvim\" is not installed"
fi



if type "pbcopy" >/dev/null 2>&1; then
else
	if type "xsel" >/dev/null 2>&1; then
		alias pbcopy='xsel --clipboard --input'
	else
		echo "\"xsel\" is not installed"
	fi
fi

#
# grep => rg
if type "rg" >/dev/null 2>&1; then
	alias grep='rg'
else
	alias grep='grep --color=auto'
	echo "\"rg\" is not installed"
fi

#
# cat => bat
#
if type "bat" >/dev/null 2>&1; then
	alias cat='bat --paging=never'
	alias less='bat'
else
	if type "batcat" >/dev/null 2>&1; then
		alias cat='batcat --paging=never'
		alias less='batcat'
	else
		# TODO
		# ifが複雑になった
		# 書き方がわからん
		echo "\"batcat\" is not installed"
	fi
fi

#
# ls => exa
# tree => exa
#
if type "exa" >/dev/null 2>&1; then
	alias l='exa --icons -a'
	alias ls='exa --icons'
	alias ll='exa --icons -al'
	alias tree='exa -T --icons --git-ignore -a'
else
	if type "eza" >/dev/null 2>&1; then
		alias l='eza --icons -a'
		alias ls='eza --icons'
		alias ll='eza --icons -al'
		alias tree='eza -T --icons --git-ignore -a'
	else
		alias l='ls -a'
		alias ll='ls -al'
		echo "\"exa\" or \"eza\" is not installed"
	fi
fi


if type "tree" >/dev/null 2>&1; then

else
	echo "\"tree\" not found"
fi

#
# df => duf
#
if type "duf" >/dev/null 2>&1; then
	alias df='duf'
else
	echo "\"duf\" is not installed"
fi

if type "fd" >/dev/null 2>&1; then
	function c() {
		cd "$( {print_cd_history; fd . ~ -t d -H} | fzf --no-sort)"
	}
	function cr() {
		cd "$(fd . / -t d -H | fzf --no-sort)"
	}
	function c.() {
		cd "$(fd -t d -H | fzf --no-sort)"
	}
else
	source $HOME/dotfiles/zsh_files/find_fzf_cd.zsh
fi

if type "kitty" >/dev/null 2>&1; then
	alias icat='kitty kitten icat'
fi

function mkcd() {
	mkdir $1 && cd $1
}

function cd() {
	builtin cd $@ && pwd && l
}

#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                              KEYBIND                                               #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#
bindkey '^b' backward-kill-word
bindkey '^f' forward-word
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                                PATH                                                #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#

_path=(
	$HOME/password/pub-bin
	$HOME/.my-bin
	$HOME/.local/bin
	$HOME/.local/kitty.app/bin
)

for dir in $_path; do
	if [ -d "$dir" ]; then
		export PATH="$dir:$PATH"
	fi
done


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
setopt hist_reduce_blanks

zshaddhistory() {
    local line="${1%%$'\n'}"
}

#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                               OTHERS                                               #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -Uz edit-command-line
zle -N edit-command-line

setopt no_beep

# kitty with ssh issue https://www.reddit.com/r/linux4noobs/comments/tkvs8o/kitty_terminal_with_ssh_issues/
export TERM=xterm-256color

function scroll-and-clear-screen() {
	printf '\n%.0s' {1..$LINES}
	zle clear-screen
}
zle -N scroll-and-clear-screen
bindkey '^l' scroll-and-clear-screen
# dotfiles first
export LC_COLLATE="C"

export HISTORY_SUBSTRING_SEARCH_PREFIXED=not-empty

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export FZF_DEFAULT_COMMAND="fd . . -H"
export FZF_DEFAULT_OPTS="--reverse --height=20 -e"
function select-history() {
	BUFFER=$(history -n -r 1 | fzf +m --query "$LBUFFER")
	CURSOR=${#BUFFER}
	zle clear-screen
}
zle -N select-history
bindkey '^r' select-history

#
# Node Version Manager
#
function load-nvm(){
	# 起動時間が0.4sくらいかかるから、必要なときだけ読み込む
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
}

# Created by `pipx` on 2024-09-01 09:14:26
export PATH="$PATH:/Users/sei-12/.local/bin"
