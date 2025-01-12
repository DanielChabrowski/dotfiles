#!/usr/bin/env bash

set -euo

cwd="$(dirname "$(readlink -f "$0")")"
readonly cwd

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

ln -sf "$cwd/zsh/.zshrc" ~/.zshrc
ln -sf "$cwd/tmux/.tmux.conf" ~/.tmux.conf
ln -sf "$cwd/emacs/init.el" ~/.emacs.d/init.el

# Install gdb dashboard
wget -P ~ git.io/.gdbinit

# Install polybar config
ln -sf "$cwd/polybar" ~/.config/polybar

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
