#!/usr/bin/env bash

set -euo pipefail

echo "Creating expected folders."
mkdir -p ~/.config/lazygit
mkdir -p ~/.ssh

echo "Pulling git submodules."
git submodule init
git submodule update

echo "Symlinking dotfiles."
ln -sf "${PWD}/.aliases" ~/.aliases
ln -sf "${PWD}/.exports" ~/.exports
ln -sf "${PWD}/.gitconfig" ~/.gitconfig
ln -sf "${PWD}/.gitignore" ~/.gitignore
ln -sf "${PWD}/.hushlogin" ~/.hushlogin
ln -sf "${PWD}/.ideavimrc" ~/.ideavimrc
ln -sf "${PWD}/.lazygit.yml" ~/.config/lazygit/config.yml
ln -sf "${PWD}/.oh-my-zsh" ~/.oh-my-zsh
ln -sf "${PWD}/.proselintrc.json" ~/.proselintrc.json
ln -sf "${PWD}/.ripgreprc" ~/.ripgreprc
ln -sf "${PWD}/.ssh/config" ~/.ssh/config
ln -sf "${PWD}/.tmux.conf" ~/.tmux.conf
ln -sf "${PWD}/.vimrc" ~/.vimrc
ln -sf "${PWD}/.zsh" ~/.zsh
ln -sf "${PWD}/.zshrc" ~/.zshrc
ln -sf "${PWD}/bin" ~/bin

if [[ "$(uname)" == "Darwin" ]]; then
    ./setup-mac.sh
fi

./setup-npm.sh
./setup-vim.sh
