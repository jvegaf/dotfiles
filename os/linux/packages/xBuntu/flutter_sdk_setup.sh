#!/bin/env bash

set -eu pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

sudo apt-get update -y && sudo apt-get upgrade -y;
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

sudo apt-get install \
    clang cmake git \
    ninja-build pkg-config \
    libgtk-3-dev liblzma-dev \
    libstdc++-12-dev

cd /tmp
curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz -o flutter_linux_3.24.3-stable.tar.xz
sudo tar xf flutter_linux_3.24.3-stable.tar.xz --directory=/usr/bin/
# echo 'export PATH="/usr/bin/flutter/bin:$PATH"' >> ~/.zshenv

log::note "Flutter SDK installed ✅, check it with 'flutter doctor -v'"

exit 0
