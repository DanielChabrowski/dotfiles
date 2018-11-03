#!/usr/bin/env bash

readonly QT_CONFIG_DIR="/home/$USER/.config/QtProject"
readonly QT_SNIPPETS_DIR="$QT_CONFIG_DIR/qtcreator/snippets"

if [ -d "$QT_CONFIG_DIR" ]; then
    cp QtCreator.ini "$QT_CONFIG_DIR"
    mkdir -p "$QT_SNIPPETS_DIR"
    cp snippets.xml "$QT_SNIPPETS_DIR"
else
    echo "QtCreator is not installed"
    exit 1
fi
