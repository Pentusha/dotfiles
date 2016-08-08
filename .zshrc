export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pure"
plugins=(
    bower celery colorize debian django git github mercurial pip 
    python postgres themes supervisor npm docker
)

# User configuration
export HISTFILE=/tmp/zsh_history
export EDITOR="vim"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export SOLARIZED_THEME='dark'
export TERM=xterm-256color

export WORKON_HOME="~/.venvs"
source /usr/local/bin/virtualenvwrapper.sh

export VIRTUAL_ENV_DISABLE_PROMPT=0
source $ZSH/oh-my-zsh.sh

alias mc='. /usr/share/mc/bin/mc-wrapper.sh'
alias vi='vim'
alias please='sudo $(fc -ln -1)'

[[ -f /usr/bin/grc ]] && {
    alias configure='grc ./configure'
    alias diff='grc diff'
    alias make='grc make'
    alias gcc='grc gcc'
    alias g++='grc g++'
    alias as='grc as'
    alias gas='grc gas'
    alias ld='grc ld'
    alias netstat='grc netstat'
    alias ping='grc ping'
    alias traceroute='grc /usr/sbin/traceroute'
    alias ls='grc ls'
}

alias -g J="| python -m json.tool"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g L="| less"
alias -g M="| most"
alias -g B="&|"
alias -g HL="--help"
alias -g LC="| wc -l"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

alias killdjango='kill -9 `lsof -t -c python -i:8000 -a`'
