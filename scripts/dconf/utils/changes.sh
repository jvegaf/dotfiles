#!/bin/user/env bash

DUMP_DCONF="$DOTFILES_PATH/os/linux/config/dconf/cinnamon/dump.sh"
RESTORE_DCONF="$DOTFILES_PATH/os/linux/config/dconf/cinnamon/restore.sh"

dump_changes() {
    sh "$DUMP_DCONF"
}

restore_changes() {
    sh "$RESTORE_DCONF"
}

