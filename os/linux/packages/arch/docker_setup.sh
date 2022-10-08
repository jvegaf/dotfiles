#!/bin/bash

sudo pacman -S --needed --noconfirm docker docker-compose 

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
sudo usermod -aG dialout $USER

#docker-clean
curl -s https://raw.githubusercontent.com/ZZROTDesign/docker-clean/v2.0.4/docker-clean |
sudo tee /usr/local/bin/docker-clean > /dev/null && \
sudo chmod +x /usr/local/bin/docker-clean
