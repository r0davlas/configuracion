# .bashrc
iatest=$(expr index "$-" i)

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Habilitar completacion
if [ -f /user/share/bash-completion/bash_completion]; then
	. /user/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion 
fi
# ignorar mayusculas/minusculas en autocompletado 
if [[ $iatest > 0]]; then bind "set completion-ignore-case on"; fi
# autocompletado automatico 
if [[ $iatest > 0]]  then bind "set show-all-if-ambiguous on" fi

# expandir historico
export HISTFILESIZE=10000
export HISTSIZE=500
# Historia sin duplicados
export HISTCONTROL=erasesups:ignoredups:ignorespace
export HISTIGNORE="&:ls:[bf]g:exit:cls:clear:sudo" # ignorar ls, y comandodo construidos
# Añadir al historico en lugar de sobreescribir, al abrir otro terminal continua con el historico anterior
shopt -s histappend
PROMPT_COMMAND='history -a'

# coloreado para paginas del manual
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# export PAGER="/usr/bin/most -s"

# funciones
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Alias
alias cls='clear'
alias cd..='cd ..'
alias ls=' ls -aFh --color=always'
alias ll='ls -l'
alias home='cd ~'

# Alias git 
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'


# remapeo para vim
setxkbmap -option caps:swapescape

