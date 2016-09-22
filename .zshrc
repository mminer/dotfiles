source ${HOME}/.exports

# Add custom scripts to path.
export PATH=${HOME}/bin:${PATH}

# Set up oh-my-zsh.
ZSH=${HOME}/.oh-my-zsh  # Set path to config file
ZSH_CUSTOM=${HOME}/.zsh # Set custom config directory
ZSH_THEME='miner'       # Load custom theme
plugins=(brew colored-man colorize copydir copyfile docker encode64 git history httpie jsontools npm osx pip python redis-cli vi-mode xcode z)
source ${ZSH}/oh-my-zsh.sh

# Set up NVM.
export NVM_DIR=${HOME}/.nvm
source $(brew --prefix nvm)/nvm.sh

# Enable iTerm shell integration.
source ${HOME}/.iterm2_shell_integration.zsh

# Turn off ZSH autocorrect.
unsetopt correct_all

alias baymax='node index.js -p 21010 -d /Users/mminer/Library/Application\ Support/Diamond\ Dev -l /Users/mminer/Library/Logs/Diamond\ Dev/diamond.log'
alias mkdir='mkdir -p'


# Functions:

# Reopen suspended session using ctrl-z (same command used to suspend it).
foreground() { fg }
zle -N foreground
bindkey '^Z' foreground
