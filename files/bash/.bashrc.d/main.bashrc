#!/bin/bash

# Python
alias ve='python -m venv venv'
alias va='source venv/bin/activate > /dev/null 2>&1 || source .venv/bin/activate > /dev/null 2>&1'
alias de='deactivate'
alias py='python'

# Ansible
alias ad='ansible-doc'
alias ag='ansible-galaxy'
alias ai='ansible-inventory'
alias al='ansible-lint'
alias ap='ansible-playbook'
alias av='ansible-vault'

# Other
alias cat='bat'
alias vim='nvim'

alias la='ls -a'
alias ll='ls -l'

alias decomment='grep --invert-match --extended-regexp "^[[:space:]]*((#|;|//).*)?$"'

# Env
export PIP_REQUIRE_VIRTUALENV=false
export EDITOR=/usr/bin/nvim
export HISTSIZE=10000

# Prompt
if ! [ -f ~/.git-prompt.sh ]; then
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output-document ~/.git-prompt.sh > /dev/null
fi

# shellcheck source=/dev/null
source ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

PS1='[\u@\h \W$(__git_ps1)]\$ '
