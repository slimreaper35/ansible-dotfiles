#!/bin/zsh

# Python
alias ve='python3 -m venv venv'
alias va='source venv/bin/activate > /dev/null 2>&1 || source .venv/bin/activate > /dev/null 2>&1'
alias de='deactivate'
alias py='python3'

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

alias ls='eza'
alias la='eza --long --header --octal-permissions --all'
alias ll='eza --long --header --octal-permissions'

alias tree='eza --tree --level=2'
alias decomment='grep --invert-match --extended-regexp "^[[:space:]]*((#|;|//).*)?$"'

# Env
export GOPATH=$HOME/.go
export PIP_REQUIRE_VIRTUALENV=true
export EDITOR=/usr/bin/nvim
export HISTFILESIZE=100000
export HISTSIZE=100000

# Prompt
if ! [ -f ~/.git-prompt.sh ]; then
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output-document ~/.git-prompt.sh > /dev/null
fi

source ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# Enable completions on macOS
autoload -Uz compinit
compinit
rm -f ~/.zcompdump; compinit

PS1='[%n@%m %1~$(__git_ps1)]\$ '
