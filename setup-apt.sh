#!/usr/bin/env bash

set -euo pipefail

echo "Installing apt packages."

sudo apt-get update

sudo apt-get install -y \
    bat \
    dos2unix \
    eza \
    fd-find \
    fzf \
    gh \
    git \
    git-delta \
    git-lfs \
    htop \
    httpie \
    jq \
    lazygit \
    prettyping \
    ripgrep \
    shellcheck \
    tldr \
    tree \
    vale \
    vim \
    yq
