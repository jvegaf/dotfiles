#!/bin/user/env bash

DOTBOT_DIR="modules/dotbot"
DOTBOT_BIN="bin/dotbot"

apply_symlinks() {
  local -r CONFIG="$DOTFILES_PATH/symlinks/$1"
  shift

  echo
  "$DOTFILES_PATH/$DOTBOT_DIR/$DOTBOT_BIN" -d "$DOTFILES_PATH" -c "$CONFIG" "$@"
  echo
}

apply_common_symlinks() {
  apply_symlinks "conf.yaml"
}

apply_linux_symlinks() {
  apply_symlinks "conf.linux.yaml"
}
