# ~/.bashrc

# Only in interactive shells
[[ $- != *i* ]] && return

# Aliases
alias ls='ls -a --color=auto'
alias ll='ls -l -a --color=auto'
alias grep='grep --color=auto'

# Prompt
PS1='[\u@\h \W]\$ '


