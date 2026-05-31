#!/bin/user/env bash

commit_all_changes() {
  cd $DOTFILES_PATH
  git add -A && git commit -m "auto updated" && git push origin main
}

