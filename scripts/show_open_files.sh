#!/usr/bin/env bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

##? View modified files
##?
##? Usage:
##?    show_open_files
docs::parse "$@"


selected=$(ps axc | awk 'NR > 1' | awk '{print substr($0,index($0,$5))}' | sort -u | fzf)

if [ ! -z $1 ]; then
  lsof -r 2 -c "$selected"
else
  lsof -c "$selected"
fi
