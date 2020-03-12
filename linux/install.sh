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
    tmux \
    powerline \
    fonts-powerline \
    python3-powerline \
    apt-transport-https \
    build-essential \
    linux-tools-common \
    git \
    cmake \
    valgrind

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install powerlevel10k
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Install zsh plugins
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

# Install zsh config
ln -sf "$cwd/zsh/.zshrc" ~/.zshrc

# Install tmux config
ln -sf "$cwd/tmux/.tmux.conf" ~/.tmux.conf

# Install tmux plugins
bash "$cwd/tmux/install_plugins.sh"

# Install vimrc
ln -sf "$cwd/vim/.vimrc" ~/.vimrc

# Install gitconfig
# Keep cp here to avoid user settings in repo
cp "$cwd/git/.gitconfig" ~/.gitconfig

# Install gdb dashboard
wget -P ~ git.io/.gdbinit

# Install xfce4-terminal settings
mkdir -p ~/.config/xfce4/terminal
ln -sf "$cwd/xfce4/terminalrc" ~/.config/xfce4/terminal/terminalrc

# Install xfce4-terminal theme
readonly theme_directory="$HOME/.local/share/xfce4/terminal/colorschemes"
mkdir -p "$theme_directory"
wget https://raw.githubusercontent.com/arcticicestudio/nord-xfce-terminal/develop/src/nord.theme -O "$theme_directory/nord.theme"

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

# Install emacs config
mkdir ~/.emacs.d/
ln -sf "$cwd/emacs/init.el" ~/.emacs.d/init.el
