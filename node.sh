#!/usr/bin/env bash

# Install NVM and latest Node LTS release.
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install --lts

npm install --global \
    diff-so-fancy \
    svgo \
    wscat
