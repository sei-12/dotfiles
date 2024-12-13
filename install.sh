#!/bin/bash

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

if [ $OS != 'Mac' ]; then
    echo "Your platform ($OS) is not supported."
    exit 1
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zprofile

brew update

brew install git
brew install fzf
brew install nvim
brew install eza
brew install rg
brew install bat
brew install tree
brew install starship
brew install duf

brew install --cask font-hack-nerd-font
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask alt-tab
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask discord
brew install --cask obsidian
brew install node
brew install --cask deepl

brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

brew tap FelixKratz/formulae
brew install sketchybar
brew install borders

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/sei-12/dotfiles.git


mkdir -p $HOME/.config

ln -s $HOME/dotfiles/.config/nvim $HOME/.config/
ln -s $HOME/dotfiles/.config/skhd $HOME/
ln -s $HOME/dotfiles/.config/yabai $HOME/
ln -s $HOME/dotfiles/.config/sketchybar $HOME/.config/
ln -s $HOME/dotfiles/.config/borders $HOME/.config/
ln -s $HOME/dotfiles/.zshrc $HOME/
ln -s $HOME/dotfiles/.gitconfig $HOME/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

defaults write -g ApplePressAndHoldEnabled -bool false