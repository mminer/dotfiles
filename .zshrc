# Set up oh-my-zsh.
ZSH=$HOME/.oh-my-zsh # Set path to oh-my-zsh config file
ZSH_THEME='miner'    # Load custom theme
plugins=(brew colored-man copydir fabric git osx pip python)
source $ZSH/oh-my-zsh.sh

# Set options.
EDITOR=/usr/local/bin/vim
unsetopt correct_all # Turn off correction prompt

# Enable shared history.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Z requirement.
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
    z --add "$(pwd -P)"
}

# Reopen suspended vim session using ctrl-z (same command used to suspend it).
foreground-vi() { fg %vi }
zle -N foreground-vi
bindkey '^Z' foreground-vi

# Simple HTTP server.
function server() {
	open "http://localhost:8000/"
	python -m SimpleHTTPServer 8000
}

# Add other locations to path.
path+="$HOME/bin/"
path+="$HOME/.rvm/bin" # Add RVM to path for scripting
path+="/usr/local/share/npm/bin/"
