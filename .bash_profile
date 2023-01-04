export EDITOR="mate -w"
export JAVA_HOME="/Users/scottb/src/fsdev/tools/jdk11"
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

# gnu time (gtime)
export TIME='\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'

# Default open files is way too low to run our tests.
ulimit -n 10000

# git aliases
alias git-branches='git for-each-ref --sort=committerdate refs/heads/ --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))"'
alias git-diff-head='git diff `git merge-base master $(git rev-parse --abbrev-ref HEAD)`..$(git rev-parse --abbrev-ref HEAD)'

# kube
alias kube-play='gcloud --project fs-playpen container clusters get-credentials --zone us-central1-b cluster-1'
alias kube-play-eu1='gcloud --project fs-playpen-eu1 container clusters get-credentials --zone europe-west3-a cluster-1'
alias kube-stage='gcloud --project fs-staging container clusters get-credentials --zone us-central1-b cluster-1'
alias kube-prod='gcloud --project fullstoryapp container clusters get-credentials --zone us-central1-b cluster-1'
alias kube-ops='gcloud --project fs-ops container clusters get-credentials --zone us-central1-c fs-ops-1'
alias kube-corp='gcloud --project fs-corp container clusters get-credentials --zone us-central1-c cluster-1'
alias kube-bwamp='gcloud --project fs-bwamp container clusters get-credentials --zone us-central1-b fs-bwamp'
alias kube-data='gcloud --project fs-datasci container clusters get-credentials --zone us-central1 cluster-1'
alias kube-dsa='gcloud --project fs-dsa-prod container clusters get-credentials --zone us-central1 cluster-1'
alias kube-build='gcloud --project fs-build container clusters get-credentials --zone us-central1-c cluster-1'

SKIP_FS_PS1=yes

source ~/.bashrc
source /Users/scottb/.fsprofile
eval "$(direnv hook bash)"
