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
alias ..='cd ..'
alias ...='cd ..;cd ..'

# 2.4) grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31' # green for matches

## ------------------------------
## -- 3) User-customized code  --
## ------------------------------


if [ -f ~/.java_custom ]; then
   source ~/.java_custom
fi

if [ -f ~/.docker_custom ]; then
   source ~/.docker_custom
fi

if [ -f ~/.aws_custom ]; then
   source ~/.aws_custom
fi

