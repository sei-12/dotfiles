#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

brew install git
brew install fzf
brew install nvim
brew install eza
brew install rg
brew install bat
brew install tree


brew install --cask font-hack-nerd-font
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask alt-tab
brew install --cask iterm2

brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

brew tap FelixKratz/formulae
brew install sketchybar
brew install borders

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

exec zsh

git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/sei-12/dotfiles.git


ln -s $HOME/dotfiles/.config/nvim $HOME/config/
ln -s $HOME/dotfiles/.config/skhd $HOME/config/
ln -s $HOME/dotfiles/.config/yabai $HOME/config/
ln -s $HOME/dotfiles/.config/sketchybar $HOME/config/
ln -s $HOME/dotfiles/.config/borders $HOME/config/