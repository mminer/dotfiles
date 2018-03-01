#!/usr/bin/env bash

# Expand save and print panels by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Dim hidden applications in the Dock.
defaults write com.apple.Dock showhidden -bool YES

killall Dock
