if [ -e /usr/local/bin/brew ]; then eval "$(/usr/local/bin/brew shellenv)"; elif [ -e /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
eval "$(direnv hook bash)"
source ~/.fsprofile
source ~/.fs_test_cert
export PATH=$HOME/.local/bin:$HOME/fsdev/tools/google-cloud-sdk/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
