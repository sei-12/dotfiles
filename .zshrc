#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                                VAR                                                 #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#

if [ "$(uname)" = 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" = 'MINGW32_NT' ]; then                                                                                           
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# 今は一旦この書き方でいい
PKG_MANAGER="brew"
if [ $OS = "Mac" ]; then
	PKG_MANAGER="brew"
elif [ $OS = "Linux" ]; then
	PKG_MANAGER="apt"
fi




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
#                                             CD HISTORY                                             #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#

CD_HISTFILE="$HOME/.cache/cd_history_file.txt"
CD_HISTSIZE=100

function chpwd_add_cd_hist(){
	CUR_DIR="$(pwd)"	
	cd_history_manager add --histfile $CD_HISTFILE --histsize $CD_HISTSIZE -a "$CUR_DIR/"
}
function print_cd_history(){
	cd_history_manager print --histfile $CD_HISTFILE
}
function get_last_work_dir(){
	cd_history_manager print --histfile $CD_HISTFILE | head -n 1
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd chpwd_add_cd_hist


#----------------------------------------------------------------------------------------------------#
#                                                                                                    #
#                                               ALIAS                                                #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#

#
# 結構使ってる
#
alias d='cd ~/Documents'
alias C='nvim .'
alias dot='cd ~/dotfiles/ && nvim .'
# alias V='nvim .'




if [ $PKG_MANAGER = "brew" ]; then
	function brew_update(){
		echo "\"update_pkgs\" に変更しました"
		return 1
	}

	alias update_pkgs='brew upgrade --cask --greedy && brew update && brew upgrade && brew cleanup'
fi

## ちょっとしたメモとかをいますぐ適当な場所に保存したい！って時に使う
alias paste_to_cache='echo -n "File Name:"; read ptc_file_name; mkdir -p ~/.cache/ptc_memo; pbpaste > ~/.cache/ptc_memo/$ptc_file_name'
alias dot='cd ~/dotfiles && code ~/dotfiles'

#
# 追加したはいいけど使ってない
#
alias lg='\ls -a -1 | \rg'
alias sc-sh='maim ~/Pictures/screen-shot/$(date "+%Y-%m-%d_%H-%M-%S").png'
alias cp_history="history 0 | awk '{\$1=\"\";print substr(\$0,2)}' | fzf |pbcopy"

#
# 追加してみる
#
alias re='exec zsh'
alias gcb='git checkout -b'
alias rm_dup="awk '!seen[\$0]++'"

function editclip(){
	TMP_FILE=$HOME/.cache/__edit_clip.tmp
	pbpaste > $TMP_FILE
	nvim $TMP_FILE
	cat $TMP_FILE | pbcopy
}

if [ $OS = "Mac" ]; then
	# finderを開く
	alias F="open ."
fi

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
		cd "$( {print_cd_history; fd . ~ -t d -H} | rm_dup | fzf --no-sort)"
		# cd "$( {print_cd_history; fd . ~ -t d -H} | rm_dup | fzf )"
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

function gen_password(){
	LENGTH=${1:-16}
	cat /dev/urandom | fold -w 256 | head -n 1 | shasum -a 256 | fold -w $LENGTH | head -n 1
}

function uuid(){
	uuidgen | xargs -I {} echo -n {} | pbcopy
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
	$HOME/Documents/MyVault/tools
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
#                                             SUB_MODULES                                            #
#                                                                                                    #
#----------------------------------------------------------------------------------------------------#

source $HOME/dotfiles/zsh_files/wezterm_zshrc.zsh

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

export FZF_DEFAULT_COMMAND="fd . . -H -E \"*.git/*\""
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


# 試験的に追加してみる
# ホームに移動するのは 'cd' だけでいいから問題はないだろうと考えてる
builtin cd $(get_last_work_dir)

