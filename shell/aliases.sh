# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias l="lsd -l"
alias ll="lsd -la"
alias ~="cd ~"
alias cdc="cd ~/Code"
alias doc="cd ~/Documents"
alias dw="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias du="du -hd 1"
alias dotfiles="cd $DOTFILES_PATH"
alias logout="gnome-session-quit --logout"
alias avcfg="nvim ~/.config/nvim/lua/user/init.lua"
alias chadcfg="cd ~/.config/nvim/lua/custom"
alias nvcfg="cd ~/.config/nvim"
alias vimcfg="cd ~/.vim"
alias r="ranger"
alias paru="paru --bottomup"
alias edalias="nvim $DOTFILES_PATH/shell/aliases.sh"
alias dfscripts="cd $DOTFILES_PATH/scripts"
alias ubscripts="cd $DOTFILES_PATH/os/linux/packages/xBuntu"
alias run="./run"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias open='xdg-open'
alias zj='zellij'
alias fks='flatpak search'
alias fki='flatpak install'
alias sns='snap search'
alias sni='snap install'

# Security
alias checkrootkits="sudo rkhunter --update; sudo rkhunter --propupd; sudo rkhunter --check"
alias checkvirus="clamscan --recursive=yes --infected /home"
alias updateantivirus="sudo freshclam"

# Git
alias g="lazygit"
alias gaa="git add -A"
alias gb="git branch"
alias gba="git branch --all"
alias gc='$DOTLY_PATH/bin/dot git commit'
alias gcl="git clone"
alias gca="git add --all && git commit --amend --no-edit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd='$DOTLY_PATH/bin/dot git pretty-diff'
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gl='$DOTLY_PATH/bin/dot git pretty-log'
alias gsw="git switch"

alias grc="gh repo clone"

# Copilot
alias cops="gh copilot suggest"
alias cope="gh copilot explain"
alias copt="gh extensions install github/gh-copilot"

# flatpak
alias fps="flatpak search"
alias fpi="flatpak install"

alias yau="yay -Syyu"
alias pau="sudo pacman -Syyu"



# Utils
alias rmd='rm -rf'
alias sb="/bin/subl"
alias v='nvim'
alias b='bat'
alias k='kill -9'
alias grep='grep --color=auto'
# alias idea='intellij-idea-ultimate-edition'
alias idea='intellij-idea-ultimate'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias cin='(code-insiders $PWD &>/dev/null &)'
alias v.='(nvim $PWD &>/dev/null &)'
alias l.='(lapce $PWD &>/dev/null &)'
alias o.='(nautilus $PWD &>/dev/null &)'
alias up='dot package update_all'
alias py='python'
alias py3='python3'

alias ddc='ddcutil setvcp 0x10 '
alias ddcx='ddcutil setvcp 0x10 0'
alias ddcv='ddcutil setvcp 0x10 100'
alias perfmode='dot system cpumode performance'
alias savemode='dot system cpumode powersave'
alias schedmode='dot system cpumode schedutil'
alias currmode='dot system cpumode current'

alias winreb='sudo grub-reboot 4 && sudo reboot'

# WSL
alias expl='/mnt/c/Windows/explorer.exe'
alias winyank='/mnt/c/Users/josev/scoop/shims/win32yank.exe'

#VPN
alias vpnup='sudo systemctl start wg-quick@TL_vpn'
alias vpndown='sudo systemctl stop wg-quick@TL_vpn'
alias vpnstatus='sudo systemctl status wg-quick@TL_vpn'
# status vpn tunnel sudo wg
