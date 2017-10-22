source ${HOME}/.aliases
source ${HOME}/.exports

# Add custom scripts to path.
export PATH=${HOME}/bin:${PATH}

# Set up oh-my-zsh.
ZSH=${HOME}/.oh-my-zsh  # Set path to config file
ZSH_CUSTOM=${HOME}/.zsh # Set custom config directory
ZSH_THEME='miner'       # Load custom theme
plugins=(colored-man colorize copydir copyfile docker encode64 git history httpie jsontools npm osx pip python redis-cli ssh-agent vi-mode xcode z)
source ${ZSH}/oh-my-zsh.sh

# Set up NVM.
source $(brew --prefix nvm)/nvm.sh

# Enable iTerm shell integration.
source ${HOME}/.iterm2_shell_integration.zsh

# Enable fuzzy finder completion and key bindings.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Turn off ZSH autocorrect.
unsetopt correct_all

# Reopen suspended session using ctrl-z (same command used to suspend it).
foreground() { fg }
zle -N foreground
bindkey '^Z' foreground
