#!/usr/bin/env bash

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write com.apple.Dock showhidden -bool YES
killall Dock
