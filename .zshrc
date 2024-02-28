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
alias pbcopy='xsel --clipboard --input'
alias lg='\ls -a -1 | \rg'
alias src='source ~/.zshrc'
alias d='cd ~/Documents'
alias dot='code ~/dotfiles'
alias C='code .'
alias sc-sh='maim ~/Pictures/screen-shot/$(date "+%Y-%m-%d_%H-%M-%S").png'
alias tree='tree -I .git -I node_modules'

#
# find => fd
#
if type "fd" >/dev/null 2>&1; then
	# alias find='fd'
else
	echo "\"fd\" is not installed"
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
# ls => ex
#
if type "exa" >/dev/null 2>&1; then
	alias l='exa -1 --icons -a'
else
	alias l='ls -a'
	echo "\"exa\" is not installed"
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
		cd "$(fd . ~ -t d -H | fzf)"
	}
	function cr() {
		cd "$(fd . / -t d -H | fzf)"
	}
	function c.() {
		cd "$(fd -t d -H | fzf)"
	}
else
	source $HOME/dotfiles/zsh_files/find_fzf_cd.zsh
fi

if type "kitty" >/dev/null 2>&1; then
	alias icat='kitty kitten icat'
fi

function rand() {
	cat /dev/urandom | tr -dc 'a-z' | fold -w $1 | head -n 1
}

function mkcd() {
	mkdir $1 && cd $1
}

function cd() {
	builtin cd $@ && l
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
export FZF_DEFAULT_OPTS="--reverse --height=20"
function select-history() {
	BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
	CURSOR=${#BUFFER}
	zle clear-screen
}
zle -N select-history
bindkey '^r' select-history

#
# Node Version Manager
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
