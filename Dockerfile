FROM ubuntu:latest

ENV LANG=C.UTF-8 \
    TERM=xterm-256color

ADD . /dotfiles/

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo curl ca-certificates wget \
    && ./dotfiles/linux/install.sh \
    && rm -rf /dotfiles/ \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT /usr/bin/env tmux
