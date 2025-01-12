#!/usr/bin/env bash

polybar-msg cmd quit

polybar --list-monitors | while read -r line; do
    m=$(cut -d":" -f1 <<< "$line")

    if [[ "$line" =~ .*"(primary)".* ]]; then
        MONITOR=$m polybar --reload primary &
    else
        MONITOR=$m polybar --reload secondary &
    fi
done
