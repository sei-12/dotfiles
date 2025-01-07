#!/bin/bash



EXT_LIST=($(code --list-extensions))

osascript -e 'quit app "Visual Studio Code"'

rm -r "$HOME/Library/Caches/com.microsoft.VSCode"
rm -r "$HOME/Library/Caches/com.microsoft.VSCode.ShipIt"

# ls | grep Cache | xargs -I {} echo "rm -r \"$(pwd)/{}\"" | pbcopy
rm -r "$HOME/Library/Application Support/Code/Cache"
rm -r "$HOME/Library/Application Support/Code/CachedData"
rm -r "$HOME/Library/Application Support/Code/CachedExtensionVSIXs"
rm -r "$HOME/Library/Application Support/Code/CachedProfilesData"
rm -r "$HOME/Library/Application Support/Code/Code Cache"
rm -r "$HOME/Library/Application Support/Code/DawnGraphiteCache"
rm -r "$HOME/Library/Application Support/Code/DawnWebGPUCache"
rm -r "$HOME/Library/Application Support/Code/GPUCache"

brew uninstall visual-studio-code

brew update
brew upgrade
brew cleanup

rm -r "$HOME/Library/Application Support/Code/User/"*

brew install --cask visual-studio-code

for ext in "${EXT_LIST[@]}"
do
    code --install-extension $ext
done

ln -s $HOME/dotfiles/.config/Code/* "$HOME/Library/Application Support/Code/User/"

code ~/dotfiles