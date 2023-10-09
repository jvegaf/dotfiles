#!/bin/bash

set -euo pipefail

echo "Downloading ⏬ Visual Studio Code"
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb

echo "Installing ⏬ Visual Studio Code"
sudo dpkg -i /tmp/code_latest_amd64.deb

echo "Visual Studio Code installed ✅"

exit 0
