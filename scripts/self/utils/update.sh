#!/bin/user/env bash

self_update() {
  cd "$DOTFILES_PATH" || exit

  git fetch
  if [[ $(project_status) == "behind" ]]; then
    log::note "Needs to pull!"
    git pull && exit 0 || log::error "Failed"
  fi
}

project_status() {
  cd "$DOTFILES_PATH" || exit

  local -r UPSTREAM="arch"
  local -r LOCAL=$(git rev-parse @)
  local -r REMOTE=$(git rev-parse "$UPSTREAM")
  local -r BASE=$(git merge-base @ "$UPSTREAM")

  if [[ "$LOCAL" == "$REMOTE" ]]; then
    echo "synced"
  elif [[ "$LOCAL" == "$BASE" ]]; then
    echo "behind"
  elif [[ "$REMOTE" == "$BASE" ]]; then
    echo "ahead"
  else
    echo "diverged"
  fi
}
