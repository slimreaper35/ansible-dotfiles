# Python
alias ve='python -m venv venv'
alias va='source venv/bin/activate'
alias de='deactivate'
alias py='python'
alias ipy='ipython'

# Ansible
alias ad='ansible-doc'
alias ag='ansible-galaxy'
alias ai='ansible-inventory'
alias al='ansible-lint'
alias ap='ansible-playbook'
alias av='ansible-vault'

# Other
alias vim='nvim'
alias cat='bat'

alias la='ls -a'
alias ll='ls -l'

alias upgrade='sudo dnf upgrade -y'
alias autoremove='sudo dnf autoremove -y'

alias decomment='grep --invert-match --extended-regexp "^[[:space:]]*((#|;|//).*)?$"'

# Env
export PIP_REQUIRE_VIRTUALENV=true
export EDITOR=/usr/bin/nvim
export HISTSIZE=10000

# Prompt
if ! [ -f ~/.git-prompt.sh ]; then
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output-document ~/.git-prompt.sh > /dev/null
fi
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

PS1='[\u@\h \W$(__git_ps1)]\$ '
