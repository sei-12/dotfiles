#!/bin/bash

if [ $(uname) != "Darwin" ] ; then
	echo "Not MacOS!"
	exit 0
fi

defaults write -g ApplePressAndHoldEnabled -bool false

# Dockを自動的に表示/非表示 = true
defaults write com.apple.dock autohide -bool true

# 自動で頭文字を大文字にしない
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool "false"

# スペルの訂正を無効にする
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool "false"

# .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"

# デフォルトで隠しファイルを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool "true"

# スクリーンショットの保存場所
if [[ ! -d "$HOME/Pictures/Screenshots" ]]; then
    mkdir -p "$HOME/Pictures/Screenshots"
fi
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots"

# アプリをしまうときのアニメーション
defaults write com.apple.dock "mineffect" -string "scale"

# 撮影時のサムネイル表示
defaults write com.apple.screencapture "show-thumbnail" -bool "false"

# Dockからすべてのアプリを消す
defaults write com.apple.dock persistent-apps -array

# F1,F2を標準のファンクションキーとして使用
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# メニューバーを自動的に表示/非表示 = "常に"
defaults write NSGlobalDomain _HIHideMenuBar -int 1
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -int 0

# すべての（デフォルトの）アプリアイコンをDockから消去する
defaults write com.apple.dock persistent-apps -array


# Dockの表示非表示を高速化
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0


killall Finder
killall Dock
killall SystemUIServer