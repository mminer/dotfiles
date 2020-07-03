#!/usr/bin/env bash

set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew update
brew upgrade

brew install \
    bat \
    fzf \
    git \
    git-lfs \
    github/gh/gh \
    htop \
    httpie \
    lua \
    noti \
    pinentry-mac \
    prettyping \
    python3 \
    ripgrep \
    ruby \
    swiftlint \
    switchaudio-osx \
    tmux \
    tldr \
    tree \
    vim \
    youtube-dl \
    zsh

# Install key bindings for fzf.
# https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-update-rc \
    --no-bash --no-fish

brew cask install \
    betterzipql \
    qlcolorcode \
    qlmarkdown \
    qlstephen \
    quicklook-csv \
    quicklook-json

brew cleanup
