#!/usr/bin/env bash

echo 'Creating expected folders.'
mkdir ~/.ssh

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
ln -s ${PWD}/.oh-my-zsh ~/.oh-my-zsh
ln -s ${PWD}/.ripgreprc ~/.ripgreprc
ln -s ${PWD}/.ssh/config ~/.ssh/config
ln -s ${PWD}/.tmux ~/.tmux
ln -s ${PWD}/.tmux.conf ~/.tmux.conf
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
# Installing nvm via brew is unsupported.
# https://github.com/nvm-sh/nvm#important-notes
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install --lts
npm install --global svgo wscat

echo 'Installing Python packages.'
pip3 install aws aws-shell http-prompt

echo 'Installing Ruby packages.'
gem colorls install jekyll jekyll-feed

echo 'Installing vim plugins.'
vim +PlugInstall +qall

echo 'Installing key bindings for fuzzy finder.'
$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-update-rc \
    --no-bash --no-fish

echo 'Changing default shell to ZSH.'
echo $(brew --prefix)/bin/zsh | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/zsh

echo 'Configuring macOS.'
./macos.sh

echo 'Doing additional configuration.'

# https://stackoverflow.com/a/40066889
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
