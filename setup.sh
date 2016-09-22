#!/bin/sh

echo 'Pulling git submodules.'
git submodule init
git submodule update

echo 'Symlinking dotfiles.'
ln -s ${PWD}/.exports ~/.exports
ln -s ${PWD}/.gitignore ~/.gitignore
ln -s ${PWD}/.oh-my-zsh ~/.oh-my-zsh
ln -s ${PWD}/.vim ~/.vim
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.vimrc.bundles ~/.vimrc.bundles
ln -s ${PWD}/.zsh ~/.zsh
ln -s ${PWD}/.zshrc ~/.zshrc
ln -s ${PWD}/bin ~/bin
chflags -h hidden ~/bin

echo 'Configuring git.'
git config --global alias.g 'log --graph --all --oneline --decorate'
git config --global rebase.autosquash true
git config --global rebase.autostash true
git config --global user.email 'matthew@matthewminer.com'
git config --global user.name 'Matthew Miner'
