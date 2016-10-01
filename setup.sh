#!/bin/sh

echo 'Pulling git submodules.'
git submodule init
git submodule update

echo 'Symlinking dotfiles.'
ln -s ${PWD}/.exports ~/.exports
ln -s ${PWD}/.gitconfig ~/.gitconfig
ln -s ${PWD}/.gitignore ~/.gitignore
ln -s ${PWD}/.hushlogin ~/.hushlogin
ln -s ${PWD}/.oh-my-zsh ~/.oh-my-zsh
ln -s ${PWD}/.vim ~/.vim
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.vimrc.bundles ~/.vimrc.bundles
ln -s ${PWD}/.zsh ~/.zsh
ln -s ${PWD}/.zshrc ~/.zshrc
ln -s ${PWD}/bin ~/bin
chflags -h hidden ~/bin

echo 'Configuring macOS.'
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write com.apple.Dock showhidden -bool YES
killall Dock
