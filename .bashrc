if [ -e /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; else eval "$(/opt/homebrew/bin/brew shellenv)"; fi
eval "$(direnv hook bash)"
source /Users/scottb/.fsprofile
