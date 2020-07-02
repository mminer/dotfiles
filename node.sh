#!/usr/bin/env bash

cd ~/.nvm
git checkout v0.35.3
source ~/.zshrc

nvm install --lts

npm install --global \
    diff-so-fancy \
    svgo \
    wscat
