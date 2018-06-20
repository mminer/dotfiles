source ${HOME}/.aliases
source ${HOME}/.exports

# Add custom scripts to path.
export PATH=${HOME}/bin:${PATH}

plugins=(
    colored-man
    colorize
    copydir
    copyfile
    docker
    encode64
    git
    history
    httpie
    jsontools
    npm
    nvm
    osx
    pip
    python
    redis-cli
    tmux
    vi-mode
    xcode
    z
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

source ${ZSH}/oh-my-zsh.sh

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
