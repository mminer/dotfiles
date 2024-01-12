#!/usr/bin/env bash

set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

# Update versions of built-in programming languages.
brew install \
    python3 \
    ruby

# Update versions of other built-in tools.
brew install \
    vim \
    zsh

# Install Git and supporting tools.
brew install \
    gh \
    git \
    git-delta \
    git-lfs \
    jesseduffield/lazygit/lazygit

# Install fzf and its key bindings.
# https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
brew install fzf

"$(brew --prefix)/opt/fzf/install" --completion --key-bindings --no-update-rc \
    --no-bash --no-fish

# Install other oft-used tools.
brew install \
    bat \
    dos2unix \
    ffmpeg \
    htop \
    httpie \
    lua \
    noti \
    pinentry-mac \
    prettyping \
    ripgrep \
    shellcheck \
    tldr \
    trash \
    tree

brew cleanup
