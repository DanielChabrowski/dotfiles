FROM ubuntu:bionic

ENV LANG=C.UTF-8
ENV TERM=xterm-256color

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo curl ca-certificates wget \
    && apt-get autoremove -y

ADD . /dotfiles/
RUN ./dotfiles/linux/install.sh \
    && rm -rf /dotfiles/

ENTRYPOINT /usr/bin/env tmux
