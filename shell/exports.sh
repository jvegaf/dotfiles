export EDITOR="/bin/nvim"
export VISUAL="/bin/nvim"
export M2_HOME="$HOME/.local/share/mise/installs/maven/3.9.16/"
# export WINEPREFIX="$HOME/.fusion360/wineprefixes/default"
export FILE_BROWSER="nautilus"
# ------------------------------------------------------------------------------
# Languages
# ------------------------------------------------------------------------------
export GEM_HOME="$HOME/.gem"
export GOPATH="$HOME/.go"
export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"
export TMUX_POWERLINE_DIR_HOME="$HOME/.config/tmux/plugins/tmux-powerline"

export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share"

# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
#
# WARNING: this array REPLACES $PATH in zsh (there `path` is tied to `PATH`).
# Anything added before this file runs (e.g. by /etc/profile.d/*.sh) is wiped,
# so every path that must survive has to be listed here explicitly.
# ------------------------------------------------------------------------------
export path=(
  # Nix - multi-user install. The system profile ships the nix CLI itself;
  # the per-user profile holds packages installed with `nix profile install`.
  "/nix/var/nix/profiles/default/bin"
  "$HOME/.nix-profile/bin"
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
