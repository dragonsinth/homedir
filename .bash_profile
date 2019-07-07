export EDITOR="mate -w"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$HOME/bin:$PATH"
export PS1="\[$(tput setaf 7)\]\w \[$(tput sgr0)\]"
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -al'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Default open files is way too low to run our tests.
ulimit -n 10000

# git aliases
alias git-branches='git for-each-ref --sort=committerdate refs/heads/ --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))"'
alias git-diff-head='git diff `git merge-base master $(git rev-parse --abbrev-ref HEAD)`..$(git rev-parse --abbrev-ref HEAD)'

# kube
alias kube-stage='gcloud --project fs-staging container clusters get-credentials --zone us-central1-b cluster-1'
alias kube-prod='gcloud --project fullstoryapp container clusters get-credentials --zone us-central1-b cluster-1'

eval "$(direnv hook bash)"
source /Users/scottb/.fsprofile
