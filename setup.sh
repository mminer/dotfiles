#!/usr/bin/env bash

echo "Creating expected folders."
mkdir ~/.ssh

echo "Pulling git submodules."
git submodule init
git submodule update

echo "Symlinking dotfiles."
ln -s "${PWD}/.aliases" ~/.aliases
ln -s "${PWD}/.exports" ~/.exports
ln -s "${PWD}/.gitconfig" ~/.gitconfig
ln -s "${PWD}/.gitignore" ~/.gitignore
ln -s "${PWD}/.hushlogin" ~/.hushlogin
ln -s "${PWD}/.ideavimrc" ~/.ideavimrc
ln -s "${PWD}/.oh-my-zsh" ~/.oh-my-zsh
ln -s "${PWD}/.proselintrc.json" ~/.proselintrc.json
ln -s "${PWD}/.ripgreprc" ~/.ripgreprc
ln -s "${PWD}/.ssh/config" ~/.ssh/config
ln -s "${PWD}/.vimrc" ~/.vimrc
ln -s "${PWD}/.zsh" ~/.zsh
ln -s "${PWD}/.zshrc" ~/.zshrc

ln -s "${PWD}/bin" ~/bin
chflags -h hidden ~/bin

mkdir -p ~/.config/lazygit
ln -s "${PWD}/lazygit.yml" ~/.config/lazygit/config.yml

echo "Installing Homebrew and packages."
./brew.sh

echo "Installing Ruby packages."
"$(brew --prefix)/opt/ruby/bin/gem" install jekyll jekyll-feed

echo "Installing npm packages."
npm install -g \
    @anthropic-ai/claude-code \
    @gltf-transform/cli \
    write-good

echo "Installing vim plugins."
./vimplugins.sh

echo "Changing default shell to ZSH."
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/zsh"

echo "Configuring macOS."
./macos.sh

echo "Doing additional configuration."

# https://stackoverflow.com/a/40066889
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
mkdir ~/.gnupg
killall gpg-agent
