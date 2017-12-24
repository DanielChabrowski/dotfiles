#!/usr/bin/env bash

config_dir="/home/$USER/.config/QtProject/"

if [ -d "$config_dir" ]; then
    cp QtCreator.ini "$config_dir"
else
    echo "QtCreator is not installed"
    exit 1
fi
