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
    git
    history
    httpie
    jsontools
    macos
    npm
    pip
    python
    redis-cli
    rust
    vi-mode
    xcode
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

# Use same keys to switch to command mode as vim.
# https://superuser.com/a/353127
bindkey -M viins 'jj' vi-cmd-mode

# Reopen suspended session using ctrl-z (same command used to suspend it).
foreground() { fg }
zle -N foreground
bindkey '^Z' foreground

# Use Homebrew's Ruby instead of the system default.
if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi
