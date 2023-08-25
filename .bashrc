if [ -e /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; else eval "$(/opt/homebrew/bin/brew shellenv)"; fi
eval "$(direnv hook bash)"
source /Users/scottb/.fsprofile
export PATH=/Users/scottb/.local/bin:/Users/scottb/src/fsdev/tools/google-cloud-sdk/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/scottb/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
