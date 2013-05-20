# oh-my-zsh setup.
ZSH=$HOME/.oh-my-zsh # Set path to oh-my-zsh config file.
ZSH_THEME='miner'    # Load custom theme
plugins=(git osx brew python fabric colored-man copydir pip)
source $ZSH/oh-my-zsh.sh

# Enable shared history.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

source $ZSH/oh-my-zsh.sh
unsetopt correct
unsetopt correct_all

setopt extendedglob
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

# Simple HTTP server.
function server() {
	open "http://localhost:8000/"
	python -m SimpleHTTPServer 8000
}

# Z requirement.
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
    z --add "$(pwd -P)"
}

path+='/usr/local/mysql/bin/'
export DYLD_LIBRARY_PATH='/usr/local/mysql/lib/'

path+="$HOME/dotfiles/bin/"
path+="$HOME/.rvm/bin" # Add RVM to path for scripting
path+="/usr/local/share/npm/bin/"

foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi
