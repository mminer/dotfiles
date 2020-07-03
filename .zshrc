source ${HOME}/.aliases
source ${HOME}/.exports

# Add custom scripts to path.
path+=(${HOME}/bin)
path+=(${HOME}/bin/diff-so-fancy)

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
    nvm
    osx
    pip
    python
    redis-cli
    ripgrep
    tmux
    vi-mode
    xcode
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    # fzf's control-T shortcut conflicts with other plugins (zsh-autosuggestions, I believe).
    # Loading it last allows it to take precedence.
    fzf
)

source ${ZSH}/oh-my-zsh.sh

# Turn off ZSH autocorrect.
unsetopt correct_all

# Use same keys to switch to command mode as vim.
# https://superuser.com/a/353127
bindkey -M viins 'jj' vi-cmd-mode

# Reopen suspended session using ctrl-z (same command used to suspend it).
foreground() { fg }
zle -N foreground
bindkey '^Z' foreground

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
