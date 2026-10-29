#!/usr/bin/env zsh
# Uncomment for debuf with `zprof`
# zmodload zsh/zprof
# autoload -Uz compinit
# compinit
# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
setopt +o nomatch
# setopt autopushd

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Start Zim
source "$ZIM_HOME/init.zsh"

# Async mode for autocompletion
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300

source "$DOTFILES_PATH/shell/init.sh"

fpath=("$DOTFILES_PATH/shell/zsh/completions" "$DOTLY_PATH/shell/zsh/completions" $fpath)


autoload -Uz promptinit && promptinit
# prompt ${DOTLY_THEME:-codely}

source "$DOTLY_PATH/shell/zsh/bindings/dot.zsh"
source "$DOTLY_PATH/shell/zsh/bindings/reverse_search.zsh"
source "$DOTFILES_PATH/shell/zsh/key-bindings.zsh"


eval "$(starship init zsh)"
eval "$(mise activate zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

[ -f ~/.keys ] && source ~/.keys
# OpenCode Go quota plugin
# source <(grep '^OPENCODE_GO' ~/.keys)

fastfetch -c $HOME/.config/fastfetch/config.jsonc

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
