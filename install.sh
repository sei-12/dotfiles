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
brew install fd
brew install node

brew install --cask font-hack-nerd-font
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask alt-tab
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask discord
brew install --cask obsidian
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

code $HOME/dotfiles/

mkdir -p $HOME/.config

ln -s $HOME/dotfiles/.config/nvim $HOME/.config/
ln -s $HOME/dotfiles/.config/skhd $HOME/
ln -s $HOME/dotfiles/.config/yabai $HOME/
ln -s $HOME/dotfiles/.config/sketchybar $HOME/.config/
ln -s $HOME/dotfiles/.config/yazi $HOME/.config/
ln -s $HOME/dotfiles/.config/wezterm $HOME/.config/
ln -s $HOME/dotfiles/.config/borders $HOME/.config/
ln -s $HOME/dotfiles/.zshrc $HOME/
ln -s $HOME/dotfiles/.gitconfig $HOME/

ln -s $HOME/dotfiles/.config/Code/* "$HOME/Library/Application Support/Code/User/"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

defaults write -g ApplePressAndHoldEnabled -bool false


# VSCode Extensions
# ❯ code --list-extensions | xargs -L 1 echo code --install-extension | pbcopy

code --install-extension asvetliakov.vscode-neovim
code --install-extension cpmcgrath.codealignment-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension enhancedjax.vscode-ayu-zed
code --install-extension esbenp.prettier-vscode
code --install-extension github.copilot
code --install-extension github.copilot-chat
code --install-extension magdalenalipka.tokyo-night-frameless
code --install-extension mhutchie.git-graph
code --install-extension ms-ceintl.vscode-language-pack-ja
code --install-extension ms-python.debugpy
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension rust-lang.rust-analyzer
code --install-extension serayuzgur.crates
code --install-extension swellaby.rust-pack
code --install-extension tamasfe.even-better-toml
code --install-extension usernamehw.errorlens


