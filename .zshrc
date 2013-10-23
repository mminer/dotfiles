EDITOR=`$(brew --prefix)`/bin/vim

# Add custom scripts location.
path+=$HOME/Dropbox/Binaries

# Set up oh-my-zsh.
ZSH=$HOME/.oh-my-zsh # Set path to config file.
ZSH_THEME='miner'    # Load custom theme.
plugins=(brew colored-man colorize copydir copyfile git osx pip python vagrant virtualenv)
source $ZSH/oh-my-zsh.sh

# Initialize Z.
. `brew --prefix`/etc/profile.d/z.sh


# Functions:

# Reopen suspended session using ctrl-z (same command used to suspend it).
foreground() { fg }
zle -N foreground
bindkey '^Z' foreground

# Simple HTTP server.
function server() {
	echo 'Starting static server on localhost:8000.'
	python -m SimpleHTTPServer 8000
}
