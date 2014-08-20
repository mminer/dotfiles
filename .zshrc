export EDITOR=`brew --prefix`/bin/vim
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

# Set up oh-my-zsh.
ZSH=$HOME/.oh-my-zsh  # Set path to config file
ZSH_CUSTOM=$HOME/.zsh # Set custom config directory
ZSH_THEME='miner'     # Load custom theme
plugins=(brew colored-man colorize copydir copyfile git history osx pip python vagrant virtualenv vi-mode)
source $ZSH/oh-my-zsh.sh

# Initialize Z.
. `brew --prefix`/etc/profile.d/z.sh

# Set up virtualenvwrapper.
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.envs

# Turn off ZSH autocorrect.
unsetopt correct_all


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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
