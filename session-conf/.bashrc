# color-set
black=$'\[\e[1;30m\]'
red=$'\[\e[1;31m\]'
green=$'\[\e[1;32m\]'
yellow=$'\[\e[1;33m\]'
blue=$'\[\e[1;34m\]'
magenta=$'\[\e[1;35m\]'
cyan=$'\[\e[1;36m\]'
white=$'\[\e[1;37m\]'
normal=$'\[\e[m\]'

function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}
function git-branch-prompt {
  local branch=`git-branch-name`
  if [ $branch ]; then printf " [%s]" $branch; fi
}
PS1="$cyan\u@\h $yellow\W\[\033[0m\]$yellow\$(git-branch-prompt)\[\033[0m\] $red\$ $normal"

export GOPATH="$HOME/gopath:/usr/share/gocode:$HOME/gopath/dde-go/"
export PATH=$PATH:$HOME/gopath/bin/

source ~/.aliasrc
