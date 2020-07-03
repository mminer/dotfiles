#!/usr/bin/env bash

echo 'Creating expected folders.'
mkdir ~/.ssh

echo 'Pulling git submodules.'
git submodule init
git submodule update

echo 'Symlinking dotfiles.'
ln -s ${PWD}/.aliases ~/.aliases
ln -s ${PWD}/.exports ~/.exports
ln -s ${PWD}/.gitconfig ~/.gitconfig
ln -s ${PWD}/.gitignore ~/.gitignore
ln -s ${PWD}/.hushlogin ~/.hushlogin
ln -s ${PWD}/.ideavimrc ~/.ideavimrc
ln -s ${PWD}/.nvm ~/.nvm
ln -s ${PWD}/.oh-my-zsh ~/.oh-my-zsh
ln -s ${PWD}/.ripgreprc ~/.ripgreprc
ln -s ${PWD}/.ssh/config ~/.ssh/config
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.zsh ~/.zsh
ln -s ${PWD}/.zshrc ~/.zshrc
ln -s ${PWD}/bin ~/bin
chflags -h hidden ~/bin

echo 'Installing Homebrew and packages.'
./brew.sh

echo 'Installing Node and npm packages.'
./node.sh

echo 'Installing Python packages.'
pip3 install aws aws-shell http-prompt

echo 'Installing Ruby packages.'
gem colorls install jekyll jekyll-feed

echo 'Installing vim plugins.'
vim +PlugInstall +qall

echo 'Changing default shell to ZSH.'
echo $(brew --prefix)/bin/zsh | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/zsh

echo 'Configuring macOS.'
./macos.sh

echo 'Doing additional configuration.'

# https://stackoverflow.com/a/40066889
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
