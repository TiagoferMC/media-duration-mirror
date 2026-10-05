#!/usr/bin/env zsh

# Mediainfo command that calls Awk script
script_path="${(%):-%x}"
script_dir="${script_path:A:h}"
mediainfo *(n) --Output="General;Name: %CompleteName%\nDuration: %Duration%\n" \
    | $script_dir/media-duration.awk \
    | column -t -s \|

