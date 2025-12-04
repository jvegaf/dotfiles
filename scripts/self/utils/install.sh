#!/bin/user/env bash

paru_setup() {
  cd /tmp || exit
  git clone https://aur.archlinux.org/paru.git
  cd paru && makepkg -si

}

yay_setup() {
  cd /tmp || exit
  git clone https://aur.archlinux.org/yay.git
  cd yay && makepkg -si
}

install_wslu() {
  sudo add-apt-repository ppa:wslutilities/wslu
  sudo apt update
  sudo apt install wslu
}

install_common_packages() {
  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/common_packages.sh"
  echo "Common packages installed"

  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/1password_setup.sh"
  echo "1Password installed"

  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/github_cli.sh"
}

install_arch_common_packages() {
  sudo pacman -Syyu --noconfirm
  sudo pacman -Syu --noconfirm --needed - <"$DOTFILES_PATH/os/linux/packages/arch/pkglist.txt"
  sh "$DOTFILES_PATH/os/linux/packages/arch/docker_setup.sh"
  echo "Docker installed"

  # sh "$DOTFILES_PATH/os/linux/packages/xBuntu/sdkman-setup.sh"
}

install_arch_linux_extra() {
  aurpkgs=$(cat "$DOTFILES_PATH/os/linux/packages/arch/aurpkglist.txt")
  if ! type yay >/dev/null 2>&1; then
    yay_setup
  fi
  yay -S "$aurpkgs" --noconfirm --needed
}

install_linux_extra() {
  # sh "$DOTFILES_PATH/os/linux/packages/xBuntu/brave_browser.sh"
  # echo "Brave installed"

  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/docker_setup.sh"
  echo "Docker installed"

  #emoji-menu       https://github.com/jchook/emoji-menu
  wget 'https://bit.ly/emoji-menu'
  chmod +x emoji-menu
  sudo mv emoji-menu /usr/local/bin

  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/sdkman-setup.sh"

  sh "$DOTFILES_PATH/os/linux/packages/xBuntu/neovim-stable.sh"
}

install_nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

  # export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  # nvm install --lts
  # nvm use lts
}

install_flatpak() {
  sudo apt install flatpak
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}
