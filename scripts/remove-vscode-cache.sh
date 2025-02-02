#!/bin/bash

osascript -e 'quit app "Visual Studio Code"'
rm -r "$HOME/Library/Application Support/Code/Cache"
rm -r "$HOME/Library/Application Support/Code/CachedData"
rm -r "$HOME/Library/Application Support/Code/CachedExtensionVSIXs"
rm -r "$HOME/Library/Application Support/Code/CachedProfilesData"
rm -r "$HOME/Library/Application Support/Code/Code Cache"
rm -r "$HOME/Library/Application Support/Code/DawnGraphiteCache"
rm -r "$HOME/Library/Application Support/Code/DawnWebGPUCache"
rm -r "$HOME/Library/Application Support/Code/GPUCache"