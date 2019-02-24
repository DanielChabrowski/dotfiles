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
   htop \
   zsh \
   rofi \
   feh \
   compton \
   tmux \
   powerline \
   fonts-powerline \
   python3-powerline \
   apt-transport-https \
   build-essential \
   linux-tools-common \
   git \
   cmake \
   clang-format-6.0 \
   clang-tidy-6.0 \
   valgrind

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install powerlevek9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Install zsh config
cp "$cwd/zsh/.zshrc" ~/.zshrc

# Install tmux config
cp "$cwd/tmux/.tmux.conf" ~/.tmux.conf

# Install tmux plugins
bash "$cwd/tmux/install_plugins.sh"

# Install vimrc
cp "$cwd/vim/.vimrc" ~/.vimrc

# Install gitconfig
cp "$cwd/git/.gitconfig" ~/.gitconfig

# Install gdb dashboard
wget -P ~ git.io/.gdbinit

# Install i3 config
mkdir -p ~/.config/i3
cp "$cwd/i3/config" ~/.config/i3

# Install polybar
mkdir -p ~/.config/polybar
cp -R "$cwd/polybar/"* ~/.config/polybar

# Install xfc4-terminal settings
mkdir -p ~/.config/xfce4/terminal
cp "$cwd/xfce4/terminalrc" ~/.config/xfce4/terminal/terminalrc

# Install compton config
cp "$cwd/compton/compton.conf" ~/.config/compton.conf

# Install nerd fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
./nerd-fonts/install.sh "Ubuntu"
./nerd-fonts/install.sh "UbuntuMono"
rm -rf nerd-fonts

# Create default project directory
mkdir -p ~/projects

# Set tmux as default shell
chsh -s /usr/bin/tmux
