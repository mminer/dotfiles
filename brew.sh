#!/usr/bin/env bash

brew update
brew upgrade

# CLI Programs
brew install bat
brew install diff-so-fancy
brew install fzf
brew install git
brew install git-lfs
brew install htop
brew install httpie
brew install lua
brew install mackup
brew install ncdu
brew install noti
brew install nvm
brew install pinentry-mac # https://stackoverflow.com/a/40066889
brew install prettyping
brew install python
brew install python3
brew install ripgrep
brew install ruby
brew install swiftlint
brew install switchaudio-osx
brew install tmux
brew install tmuxinator-completion
brew install tldr
brew install tree
brew install vim
brew install youtube-dl
brew install zsh

# QuickLook Plugins
brew cask install betterzipql
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json

brew cleanup
