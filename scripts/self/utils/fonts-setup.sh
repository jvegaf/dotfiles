#!/bin/bash

set -euo pipefail


install_fonts() {
  filename="fonts.tar.gz"
  curl -L "https://drive.google.com/uc?export=download&id=1jRaEbc7xHelAbfHt8EGn1Cxfes94JVQD" -o ${filename}
  tar zxvf ${filename}
  mv fonts ~/.fonts
  rm -rf ${filename}

  echo "Fonts installed 🚀"
}
