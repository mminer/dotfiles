# oh-my-zsh setup.
ZSH=$HOME/.oh-my-zsh # Set path to oh-my-zsh config file.
ZSH_THEME='miner'    # Load custom theme
plugins=(git osx brew python)
source $ZSH/oh-my-zsh.sh

# Enable shared history.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export EDITOR='vim'

