#!/usr/bin/env bash

set -euo

readonly cwd="$(dirname "$(readlink -f "$0")")"

sudo apt-get update \
   && sudo apt-get install -y --no-install-recommends \
   curl \
   ca-certificates \
   vim \
   wget \
   tree \
   tmux \
   powerline \
   fonts-powerline \
   python3-powerline \
   apt-transport-https \
   build-essential \
   linux-tools-common \
   git \
   cmake \
   clang-format-5.0 \
   clang-tidy-5.0 \
   valgrind

# Install .bashrc file
cp "$cwd/bash/.bashrc" ~/.bashrc

# Install tmux config
cp "$cwd/tmux/.tmux.conf" ~/.tmux.conf

# Install tmux plugins
bash "$cwd/tmux/install_plugins.sh"

# Install powerline configuration
mkdir -p ~/.config
cp -R "$cwd/powerline" ~/.config/powerline

# Install vimrc
cp "$cwd/vim/.vimrc" ~/.vimrc

# Install gitconfig
cp "$cwd/git/.gitconfig" ~/.gitconfig

# Install gdb dashboard
wget -P ~ git.io/.gdbinit
