#!/usr/bin/env bash

set -e

brew update
brew upgrade

brew install \
    bat \
    fzf \
    git \
    git-lfs \
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

brew cask install \
    betterzipql \
    qlcolorcode \
    qlmarkdown \
    qlstephen \
    quicklook-csv \
    quicklook-json

brew cleanup
