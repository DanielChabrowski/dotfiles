#!/usr/bin/env bash

# install plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-cpu ~/.tmux/plugins/tmux-cpu
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-prefix-highlight ~/.tmux/plugins/tmux-prefix-highlight

bash ~/.tmux/plugins/tmux-cpu/cpu.tmux
bash ~/.tmux/plugins/tmux-resurrect/resurrect.tmux
bash ~/.tmux/plugins/tmux-prefix-highlight/prefix_highlight.tmux
