autoload -U colors && colors

setopt PROMPT_SUBST

set_prompt() {

    PS1="%(?::%{$fg_bold[red]%} ! )"
    PS1+="%{$fg_bold[white]%}[%{$reset_color%}"
    PS1+="%{$fg[white]%}${HOST} %{$reset_color%}"
    PS1+="%{$fg_bold[cyan]%}%c%{$reset_color%}"
    if (( ${+VIRTUAL_ENV} )); then
        PS1+=" %{$fg_bold[green]%}${VIRTUAL_ENV:t}%{$reset_color%}"
    fi
    PS1+="%{$fg_bold[white]%}] %{$reset_color%}%"
    PS1+=" $(git_prompt_info)"

    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
}

precmd_functions+=set_prompt
