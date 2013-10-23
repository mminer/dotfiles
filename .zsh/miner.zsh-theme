PROMPT='%(?.%F{cyan}.%F{red})❯%f '
RPROMPT='%{$fg_no_bold[magenta]%}%~ $(git_prompt_info)%{$reset_color%}'

# Git colours.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[white]%}[%{$fg_no_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_no_bold[white]%}] %{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_no_bold[white]%}] %{$fg_bold[green]%}●"

