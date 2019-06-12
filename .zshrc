source ${HOME}/.aliases

if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null; then
    source ${HOME}/.aliases-wsl
fi

source ${HOME}/.exports

# Add custom scripts to path.
export PATH=${HOME}/bin:${PATH}

plugins=(
    colored-man-pages
    colorize
    copydir
    copyfile
    docker
    docker-compose
    encode64
    fasd
    git
    gpg-agent
    history
    httpie
    jsontools
    npm
    npx
    osx
    pip
    python
    redis-cli
    tmux
    vi-mode
    xcode
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

# Set up nvm.
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# Reopen suspended session using ctrl-z (same command used to suspend it).
foreground() { fg }
zle -N foreground
bindkey '^Z' foreground
