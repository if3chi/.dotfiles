#!/bin/bash

# Get the currently focused monitor
CURRENT_MONITOR=$(hyprctl monitors | grep 'focused: yes' -B 11 | grep "Monitor" | grep -o 'ID [0-9]\+' | cut -d' ' -f2)

# Get all monitors
MONITORS=($(hyprctl monitors | grep "Monitor" | grep -o 'ID [0-9]\+' | cut -d' ' -f2))

# Determine the next monitor to focus
if [ "${CURRENT_MONITOR}" == "${MONITORS[0]}" ]; then
    NEXT_MONITOR=${MONITORS[1]}
else
    NEXT_MONITOR=${MONITORS[0]}
fi

# Switch focus to the next monitor
hyprctl dispatch focusmonitor ${NEXT_MONITOR}
