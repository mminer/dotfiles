source $HOME/.exports

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

# Turn off ZSH autocorrect.
unsetopt correct_all


# Functions:

# Reopen suspended session using ctrl-z (same command used to suspend it).
foreground() { fg }
zle -N foreground
bindkey '^Z' foreground

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
