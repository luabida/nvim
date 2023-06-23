!/bin/bash

if [ $(id -u) -ne 0 ]; then
  SUDO=sudo
fi

$SUDO apt-get install -y \
  git \
  cmake \
  unzip \
  wget \
  gettext \
  g++ \
  ninja-build 
 
git clone https://github.com/neovim/neovim --branch v0.9.1 /tmp/neovim
cd /tmp/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && $SUDO make install && cd -

