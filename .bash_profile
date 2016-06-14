# The next line updates PATH for the Google Cloud SDK.
source '/Users/scottb/installs/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/scottb/installs/google-cloud-sdk/completion.bash.inc'

export EDITOR="mate -w"
export JAVA_HOME=$(java_home)
export PATH="$HOME/bin:$HOME/installs/go_appengine:$PATH"
export PS1="\[$(tput setaf 7)\]\w \[$(tput sgr0)\]"
export GOROOT=/usr/local/Cellar/go/1.5.1/libexec
export GOPATH=~/src/mn/projects/fullstory/go
export FS_HOME=~/src/mn/projects/fullstory
export FS_LOCAL=true
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
