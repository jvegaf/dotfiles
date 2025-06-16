#!/bin/bash

set -euo pipefail

echo "Downloading ⏬ Visual Studio Code Insiders"
wget 'https://code.visualstudio.com/sha/download?build=insider&os=linux-deb-x64' -O /tmp/code_insider_amd64.deb
echo "Installing ⏬ Visual Studio Code Insiders"
sudo dpkg -i /tmp/code_insider_amd64.deb

echo "Visual Studio Code installed ✅"

exit 0
