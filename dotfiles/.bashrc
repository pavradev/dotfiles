# Make prompt informative
# See:  http://www.ukuug.org/events/linux2003/papers/bash_tips/
PS1="\[\033[0;34m\][\u@\h:\w]$\[\033[0m\]"

## -----------------------
## -- 2) Set up aliases --
## -----------------------

# 2.1) Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# 2.2) Listing, directories, and motion
alias ll="ls -alFG"
alias la="ls -A"
alias l="ls -CF"
#alias dir='ls --color=auto --format=vertical'
#alias vdir='ls --color=auto --format=long'
alias m='less'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias cl='clear'
alias du='du -ch --max-depth=1'
alias treeacl='tree -A -C -L 2'

# 2.4) grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31' # green for matches

## ------------------------------
## -- 3) User-customized code  --
## ------------------------------

## Define any user-specific variables you want here.
source ~/.bashrc_custom
