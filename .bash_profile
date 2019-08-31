
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=$PATH:$HOME/bin
export PATH
source $HOME/.alias

#0;30m   Black
#0;31m   Red
#0;32m   Green
#0;33m   Yellow
#0;34m   Blue
#0;35m   Purple
#0;36m   Cyan
#0;37m   White

PS1="\033[0;36m\u@\h:\033[0;37m\w:\$\033[0;37m "  # blue
#PS1="\033[0;32m\u@\h:\033[0;37m\w:\$\033[0;37m "  # green
#PS1="\033[0;33m\u@\h:\033[0;37m\w:\$\033[0;37m "  # yellow
#PS1="\033[0;31m\u@\h:\033[0;35m\w:\$\033[0;37m "  # red

# add date with prefix
#PS1='\[\e[1;37m\][\D{%Y/%m/%d} \t \u@\h \W]\$\[\e[m\] '

export LANG=C
#export LANG=ja_JP.UTF-8

export BLOCKSIZE='k'
export PAGER='more'
export EDITOR='vi'
export PROMPT_COMMAND='echo -ne "\033]0;$(whoami)@$(hostname):$(pwd)\007"'
export PS1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LD_LIBRARY_PATH=$HOME/lib

# exclude-dir: grep-2.5.2
export GREP_OPTIONS="--color=auto --exclude-dir=.git"
export GREP_COLOR="1;41;37"
#export GREP_COLOR='1;37;41'

# for git gardle
export GIT_PAGER="LESSCHARSET=utf-8 less"

function rgrep {
  find "." -type f -name $2 -exec grep $1 {} /dev/null \;
}
