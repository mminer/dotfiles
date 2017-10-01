#!/usr/bin/env bash

echo 'Creating expected folders.'
mkdir ~/.nvm
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
ln -s ${PWD}/.mackup.cfg ~/.mackup.cfg
ln -s ${PWD}/.oh-my-zsh ~/.oh-my-zsh
ln -s ${PWD}/.ssh/config ~/.ssh/config
ln -s ${PWD}/.tmux.conf ~/.tmux.conf
ln -s ${PWD}/.vim ~/.vim
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.vimrc.bundles ~/.vimrc.bundles
ln -s ${PWD}/.zsh ~/.zsh
ln -s ${PWD}/.zshrc ~/.zshrc
ln -s ${PWD}/bin ~/bin
chflags -h hidden ~/bin

echo 'Installing Homebrew and packages.'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
./brew.sh

echo 'Installing Node and npm packages.'
export NVM_DIR=${HOME}/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install 8
npm install --global svgo

echo 'Installing vim plugins.'
vim +PluginInstall +qall

echo 'Changing default shell to ZSH.'
echo $(brew --prefix)/bin/zsh | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/zsh

echo 'Configuring macOS.'
./macos.sh

echo 'Enabling iTerm shell integration.'
curl -L https://iterm2.com/misc/zsh_startup.in -o ~/.iterm2_shell_integration.zsh

echo 'Restoring mackup settings.'
read -p "Sign into Dropbox and wait for syncing to complete before hitting enter." -n1 -s
mackup restore
