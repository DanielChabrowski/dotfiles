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
   unzip \
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

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zdharma/history-search-multi-word.git ~/.oh-my-zsh/custom/plugins/history-search-multi-word

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

# Install xfce4-terminal settings
mkdir -p ~/.config/xfce4/terminal
cp "$cwd/xfce4/terminalrc" ~/.config/xfce4/terminal/terminalrc

# Install xfce4-terminal theme
git clone https://github.com/arcticicestudio/nord-xfce-terminal.git /tmp/xfce-theme
bash /tmp/xfce-theme/install.sh

# Install nerd fonts
readonly font_directory="$HOME/.local/share/fonts"

for font_name in "Ubuntu" "UbuntuMono"; do
  (
    declare -r zip_file="$PWD/$font_name.zip"
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/$font_name.zip"
    trap 'rm $zip_file' EXIT
    unzip -of -d "$font_directory" "$zip_file"
  )
done

# Reset font cache
fc-cache -f "$font_directory"

# Create default project directory
mkdir -p ~/projects

# Set tmux as default shell
chsh -s /usr/bin/tmux
