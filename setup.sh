#!/usr/bin/env bash

echo 'Creating expected folders.'
mkdir ~/.nvm ~/.ssh

echo 'Pulling git submodules.'
git submodule init
git submodule update

echo 'Symlinking dotfiles.'
ln -s ${PWD}/.aliases ~/.aliases
ln -s ${PWD}/.aliases-wsl ~/.aliases-wsl
ln -s ${PWD}/.exports ~/.exports
ln -s ${PWD}/.gitconfig ~/.gitconfig
ln -s ${PWD}/.gitignore ~/.gitignore
ln -s ${PWD}/.hushlogin ~/.hushlogin
ln -s ${PWD}/.ideavimrc ~/.ideavimrc
ln -s ${PWD}/.mackup.cfg ~/.mackup.cfg
ln -s ${PWD}/.oh-my-zsh ~/.oh-my-zsh
ln -s ${PWD}/.ripgreprc ~/.ripgreprc
ln -s ${PWD}/.ssh/config ~/.ssh/config
ln -s ${PWD}/.tmux ~/.tmux
ln -s ${PWD}/.tmux.conf ~/.tmux.conf
ln -s ${PWD}/.tmuxinator ~/.tmuxinator
ln -s ${PWD}/.vim ~/.vim
ln -s ${PWD}/.vimrc ~/.vimrc
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

echo 'Installing Ruby packages.'
gem install jekyll jekyll-feed tmuxinator

echo 'Installing vim plugins.'
vim +PlugInstall +qall
(cd ~/.vim/bundle/omnisharp-vim/server && xbuild)

echo 'Installing key bindings for fuzzy finder.'
$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-update-rc \
    --no-bash --no-fish

echo 'Changing default shell to ZSH.'
echo $(brew --prefix)/bin/zsh | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/zsh

echo 'Configuring macOS.'
./macos.sh

echo 'Restoring mackup settings.'
read -p "Sign into Dropbox and wait for syncing to complete before hitting enter." -n1 -s
mackup restore
