#!/bin/sh

echo 'Pulling git submodules.'
git submodule init
git submodule update

echo 'Symlinking dotfiles.'
ln -s .exports ~/.exports
ln -s .gitignore ~/.gitignore
ln -s .vim ~/.vim
ln -s .vimrc ~/.vimrc
ln -s .vimrc.bundles ~/.vimrc.bundles
ln -s .zsh ~/.zsh
ln -s .zshrc ~/.zshrc
