eval "$(ssh-agent -s)"
[ -f ~/.ssh/jvegaf_ed25519 ] && ssh-add ~/.ssh/jvegaf_ed25519
source "$ZIM_HOME/login_init.zsh" -q &!
