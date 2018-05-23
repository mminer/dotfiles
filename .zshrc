source ${HOME}/.aliases
source ${HOME}/.exports

# Add custom scripts to path.
export PATH=${HOME}/bin:${PATH}

# Set up oh-my-zsh.
ZSH=${HOME}/.oh-my-zsh  # Set path to config file
ZSH_CUSTOM=${HOME}/.zsh # Set custom config directory
ZSH_THEME='miner'
plugins=(colored-man colorize copydir copyfile docker encode64 git history httpie jsontools npm osx pip python redis-cli vi-mode xcode z)
source ${ZSH}/oh-my-zsh.sh

# Set up highlighting.
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable extended completions.
fpath=($(brew --prefix)/share/zsh-completions $fpath)

# Set up NVM.
source $(brew --prefix nvm)/nvm.sh

# Enable fuzzy finder completion and key bindings.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Turn off ZSH autocorrect.
unsetopt correct_all

# Use same keys to switch to command mode as vim.
# https://superuser.com/a/353127
bindkey -M viins 'jj' vi-cmd-mode

# Reopen suspended session using ctrl-z (same command used to suspend it).
foreground() { fg }
zle -N foreground
bindkey '^Z' foreground
