#!/usr/bin/env bash

echo "Writing defaults settings."

defaults write -globalDomain ApplePressAndHoldEnabled -bool false
defaults write -globalDomain AppleShowAllExtensions -bool true
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
defaults write com.apple.dock show-process-indicators -bool false
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder _FXSortFoldersFirst -bool true

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

# Open iTerm instead of Terminal from BBEdit's "Go Here in Terminal" command.
defaults write com.barebones.bbedit TerminalBundleID -string "com.googlecode.iterm2"

# https://github.com/rxhanson/Rectangle#window-resizing-is-off-slightly-for-iterm2
defaults write com.googlecode.iterm2 DisableWindowSizeSnap -integer 1

# Required for some settings to take effect.
killall Dock
