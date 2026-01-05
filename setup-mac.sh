#!/usr/bin/env bash

set -euo pipefail

echo "Configuring macOS."

./setup-brew.sh
./setup-mac-defaults.sh

chflags nohidden ~/Library
chflags -h hidden ~/bin

echo "Changing default shell to ZSH."
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/zsh"

echo "Installing Ruby packages."
"$(brew --prefix)/opt/ruby/bin/gem" install jekyll jekyll-feed
