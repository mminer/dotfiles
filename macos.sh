#!/usr/bin/env bash

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Dim hidden applications in the Dock.
defaults write com.apple.Dock showhidden -bool YES

# Make Library folder visible.
chflags nohidden ~/Library

killall Dock
