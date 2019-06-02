#!/bin/bash
#
# environment
#

set -o vi
#
# aliases
#

alias m='more ';
#alias ls='ls --color=always '; # colors are useful. to temporarily disable, use: unalias ls
alias l='ls -lF ';
alias ll='ls -lAF ';
alias la='ls -laAF ';
alias lm='l | m ';
alias llm='ll | m '
alias lsd='ls -lAd */ '; # list only directories
alias lt='l -tr';       # list in reverse order of creation/modified time
alias g='grep ';
alias md='mkdir ';
alias rd='rmdir ';
alias ..='cd .. ';
alias rm='rm -i ';
alias h='history ';
alias j='jobs ';
alias k9='kill -9';
alias d='dirs -l -p -v ';

HISTCONTROL=ignoreboth;
HISTIGNORE=l:ll:h:rmj:lm:llm:ls:lsa:lsd:lt:d:m