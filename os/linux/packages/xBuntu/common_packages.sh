#!/bin/bash

sudo apt -y install software-properties-common

sudo apt update
sudo apt upgrade -y
sudo apt-get -y install tldr python3-pip vlc build-essential htop screenfetch openjdk-11-jdk wget docker.io docker-compose vim simplescreenrecorder rofi xclip xdotool grep coreutils locate

# ubuntu distro
#sudo apt-get install -y gnome-sushi gnome-tweaks


sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

#emoji-menu       https://github.com/jchook/emoji-menu
wget 'https://bit.ly/emoji-menu'
chmod +x emoji-menu
sudo mv emoji-menu /usr/local/bin

#docker-clean
curl -s https://raw.githubusercontent.com/ZZROTDesign/docker-clean/v2.0.4/docker-clean |
sudo tee /usr/local/bin/docker-clean > /dev/null && \
sudo chmod +x /usr/local/bin/docker-clean

#chrome
wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb
sudo dpkg -i google-chrome-unstable_current_amd64.deb
rm -rf google-chrome-unstable_current_amd64.deb

#nodejs
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install -y nodejs yarn

#dotNet 5
#wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
#sudo dpkg -i packages-microsoft-prod.deb
#sudo rm -rf packages-microsoft-prod.deb
#sudo apt-get update
#sudo apt-get install -y apt-transport-https
#sudo apt-get update
#sudo apt-get install -y dotnet-sdk-5.0
#
#snaps

sudo snap install code --classic 
sudo snap install intellij-idea-ultimate --classic
sudo snap install gitkraken --classic