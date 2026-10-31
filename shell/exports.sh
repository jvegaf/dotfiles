export EDITOR="/bin/nvim"
export VISUAL="/bin/nvim"
export M2_HOME="$HOME/.local/share/mise/installs/maven/3.9.16/"
# export WINEPREFIX="$HOME/.fusion360/wineprefixes/default"
export FILE_BROWSER="dolphin"
# ------------------------------------------------------------------------------
# Languages
# ------------------------------------------------------------------------------
export GEM_HOME="$HOME/.gem"
export GOPATH="$HOME/.go"
export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"
export TMUX_POWERLINE_DIR_HOME="$HOME/.config/tmux/plugins/tmux-powerline"

# XDG_DATA_DIRS REPLACES the value set by /etc/profile.d/flatpak.sh, so the system
# data dirs must be listed explicitly. Dropping /usr/share breaks icon/image loading
# because glycin and gdk-pixbuf read their loader configs from /usr/share/glycin-loaders.
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:/usr/local/share:/usr/share"

# Engram: the OpenCode engram plugin defaults ENGRAM_BIN to /usr/bin/engram, but
# engram is installed user-locally. Without this the plugin cannot resolve its
# local server identity, never registers a session, and every write is refused
# with "could not confirm Engram session registration" (reads still work, since
# they go over the MCP stdio server, which needs no session).
export ENGRAM_BIN="$HOME/.local/bin/engram"

# gentle-pi — the agents view. Pi and gentle-pi defaults use alt+a for it, which
# collides with the herdr prefix, so it lives here instead.
# Related defaults: GENTLE_PI_AGENTS_KEY (collapse card, ctrl+shift+a),
# GENTLE_PI_AGENTS_STOP_KEY (stop a subagent, alt+s).
export GENTLE_PI_AGENTS_VIEW_KEY="ctrl+shift+j"

# REA (Reverse Engineer Anything) — analysis engines
export GHIDRA_INSTALL_DIR=/opt/ghidra
export HOPPER_LAUNCHER_PATH=/opt/hopper-v4/bin/Hopper

# pnpm
export PNPM_HOME="/home/th3g3ntl3man/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME/bin:"*) ;;
*) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
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
  "$HOME/.gentle-shell/bin"
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
