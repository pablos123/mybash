#!/bin/bash
#
#
# DOCS
# https://github.com/muesli/duf
# https://github.com/sharkdp/hyperfine
# https://github.com/stedolan/jq
# https://github.com/BurntSushi/ripgrep
# https://github.com/sharkdp/bat
# https://github.com/sivel/speedtest-cli
# https://github.com/eradman/entr
# https://github.com/eza-community/eza

apt_packages=(
  duf
  entr
  inotify-tools
  hyperfine
  ripgrep
  jq
  bat
  firefox
  chromium
  zathura
  zathura-djvu
  xchm
  xdotool
  sqlitebrowser
  git
  d-feet
  yad
  tree
  htop
  scrot
  at
  xclip
  xsel
  tmux
  stow
  progress
  newsboat
  libnotify-bin
  anacron
  calendar
  ffmpeg
  imagemagick
  sxiv
  mpv
  vlc
  mypaint
  kolourpaint
  unzip
  cowsay
  lolcat
  fortune-mod
  hsetroot
  neofetch
  picom
  flameshot
  gpick
  wmctrl
  espeak
  keepassxc
  flatpak
  cargo
  golang
  luarocks
  cpanminus
  python3-venv
  lightdm
  lightdm-gtk-greeter
  gtk2-engines-murrine
  x11-xserver-utils
  xdg-utils
  iftop
  cbm
  tcptrack
  nload
  virtualbox
  vagrant
)

cargo_packages=(
  eza
)

pip_packages=(
  speedtest-cli
)
