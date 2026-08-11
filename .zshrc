source $HOME/.aliases
source $HOME/.exports

plugins=(
    bbedit
    colored-man-pages
    colorize
    copyfile
    copypath
    docker
    docker-compose
    gh
    git
    httpie
    jsontools
    macos
    npm
    nvm
    pip
    python
    redis-cli
    z
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

# Reopen suspended session using ctrl-z (same command used to suspend it).
foreground() { fg }
zle -N foreground
bindkey '^Z' foreground

temp() {
    cd "$(mktemp -d)"
    chmod -R 0700 .

    if [[ $# -eq 1 ]]; then
        \mkdir -p "$1"
        cd "$1"
        chmod -R 0700 .
    fi
}
