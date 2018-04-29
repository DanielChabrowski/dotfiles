#!/usr/bin/env bash

set -euo

readonly cwd="$(dirname "$(readlink -f "$0")")"

if [ -n "$PACKAGES_INSTALL_DISABLED" ]; then
    bash "$cwd/install_packages.sh"
fi

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Install .bashrc file
cp "$cwd/bash/.bashrc" ~/.bashrc

# Install tmux config
cp "$cwd/tmux/.tmux.conf" ~/.tmux.conf

# Install tmux plugins
bash "$cwd/tmux/install_plugins.sh"

# Install powerline configuration
cp -R "$cwd/powerline" ~/.config/powerline

# Install vimrc
cp "$cwd/vim/.vimrc" ~/.vimrc

# Make vim git's default editor
git config --global core.editor "vim"
