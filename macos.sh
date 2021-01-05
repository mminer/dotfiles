#!/usr/bin/env bash

chflags nohidden ~/Library

defaults write -globalDomain AppleShowAllExtensions -bool true
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
defaults write com.apple.dock show-process-indicators -bool false
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.universalaccess reduceTransparency -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Dim hidden applications in the Dock.
defaults write com.apple.Dock showhidden -bool true

# Use column view in all Finder windows by default.
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Disable disk image verification.
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Expand save and print panels by default.
defaults write -globalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write -globalDomain PMPrintingExpandedStateForPrint -bool true

# Support dragging a window from anywhere by holding command-control-option while dragging.
defaults write -globalDomain NSWindowShouldDragOnGesture true

killall Dock
