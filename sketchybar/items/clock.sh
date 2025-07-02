#!/usr/bin/env sh

sketchybar --add item clock right \
           --set clock \
             update_freq=60 \
             icon=􀐫 \
             label="$(date '+%H:%M')" \
             script="echo \"label=\$(date '+%H:%M')\"" 