#!/usr/bin/env bash

set -eu pipefail

# paru -S --needed --noconfirm - < latest_hypr_pkgs.txt
paru -S --needed --noconfirm - < common.pkgs.txt
paru -S --needed --noconfirm - < apps.pkgs.txt

# yay -S --needed --noconfirm - < common.pkgs.txt

exit 0
