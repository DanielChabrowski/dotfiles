FROM ubuntu:bionic

ENV LANG=C.UTF-8
ENV TERM=xterm-256color

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo curl git ca-certificates wget \
    && apt-get install -y --no-install-recommends \
    vim \
    tree \
    tmux \
    fish \
    powerline \
    fonts-powerline \
    python3-powerline \
    apt-transport-https \
    build-essential \
    git \
    cmake \
    clang-format-5.0 \
    clang-tidy-5.0 \
    valgrind \
    && apt-get autoremove -y

ADD . /Environment/
RUN PACKAGES_INSTALL_DISABLED=1 ./Environment/linux/install.sh \
    && rm -rf /Environment/

ENTRYPOINT /usr/bin/env tmux
