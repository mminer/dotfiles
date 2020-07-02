#!/usr/bin/env bash

set -e

apt update
apt upgrade

apt install --yes \
    bat \
    fzf \
    git \
    git-lfs \
    htop \
    httpie \
    lua5.3 \
    prettyping \
    python3 \
    ripgrep \
    ruby \
    tmux \
    tldr \
    tree \
    vim \
    youtube-dl \
    zsh

apt clean
