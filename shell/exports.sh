export EDITOR="/bin/nvim"
export M2_HOME="$HOME/.sdkman/candidates/maven/current"
# export WINEPREFIX="$HOME/.fusion360/wineprefixes/default"
export FILE_BROWSER="thunar"
# ------------------------------------------------------------------------------
# Languages
# ------------------------------------------------------------------------------
export GEM_HOME="$HOME/.gem"
export GOPATH="$HOME/.go"
export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"
export TMUX_POWERLINE_DIR_HOME="$HOME/.config/tmux/plugins/tmux-powerline"
# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
# ------------------------------------------------------------------------------
export path=(
  "$HOME/.bin"
  "$HOME/.opt"
  "$DOTLY_PATH/bin"
  "$DOTFILES_PATH/bin"
  "$GEM_HOME/bin"
  "$GOPATH/bin"
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "/usr/local/opt/ruby/bin"
  "/usr/local/opt/python/libexec/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/bin"
  "/usr/bin"
  "/usr/bin/flutter/bin"
  "/usr/sbin"
  "/sbin"
  "$HOME/.platformio/penv/bin"
)
