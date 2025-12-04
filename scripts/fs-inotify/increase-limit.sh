#!/bin/bash

echo "increasing watchfiles number...📈"
sudo cp $DOTFILES_PATH/os/linux/configs/fs-inotify/editors.conf /etc/sysctl.d/
sudo sysctl -p --system


