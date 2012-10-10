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

# Aliases.
alias pocket='~/Library/Scripts/pocket.py'
alias notes='vim ~/Dropbox/Notes/Scratchpad.md'
alias eb='~/Dropbox/Tools/AWS-ElasticBeanstalk-CLI-2-1.1/eb/macosx/python2.7/eb'

# Simple HTTP server.
function server() {
	python -m SimpleHTTPServer "$port"
	local port="${1:-8000}"
	open "http://localhost:${port}/"
}

# Z requirement.
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
    z --add "$(pwd -P)"
}

path+='~/Downloads/storm-0.8.0/bin/'
