#!/usr/bin/env bash

set -euo

sudo apt-get update \
   && sudo apt-get install -y --no-install-recommends \
   vim \
   wget \
   tree \
   tmux \
   powerline \
   fonts-powerline \
   python3-powerline \
   apt-transport-https \
   build-essential \
   git \
   cmake \
   clang-format-5.0 \
   clang-tidy-5.0 \
   valgrind
