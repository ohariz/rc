function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' || ''
}
PS1='\033[36m\u@\h:\w$(parse_git_branch)\$\033[0m '

HISTSIZE=10000
HISTFILESIZE=10000

alias g="git"
